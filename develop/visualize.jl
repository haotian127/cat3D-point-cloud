using LightGraphs, Plots, JLD, Statistics
plotlyjs()

include("..\\src\\gplot.jl")
include("..\\src\\Centerized.jl")
include("..\\src\\helpers.jl")

G = loadgraph(".\\data\\cat8_simplified_vert503.lgz")
# savegraph(".\\data\\cat8_graph.lgz", G)
X = Centerized(load(".\\data\\cat8_simplified_vert503_xyz.jld", "xyz"))
# save(".\\data\\cat8_xyz.jld", "xyz", X)
N = nv(G)

# scatter(X[:,1], X[:,2], X[:,3], aspect_ratio = 1, xlims = [-100, 100], ylims = [-100, 100], zlims = [-100, 100])
# gplot(1.0*adjacency_matrix(G), X)

 ## stripe
cat_plot(X; marker = sin.(0.1 .* X[:,2]))

## tail
ind_tail = findall(X[:,2] .> 50)
cat_plot(X; marker = characteristic(ind_tail, N))

## head
ind_head = findall(X[:,2] .< -50)
cat_plot(X; marker = characteristic(ind_head, N))

## ears
ind_ear = findall((X[:,2] .< -50) .& (X[:,3] .> 17))
cat_plot(X; marker = characteristic(ind_ear, N))

## claw
ind_front_claw = findall((X[:,3] .< -22) .& (X[:,2] .< 0))
cat_plot(X; marker = characteristic(ind_front_claw, N))
ind_rear_claw = findall((X[:,3] .< -17) .& (X[:,2] .> 0))
cat_plot(X; marker = characteristic(ind_rear_claw, N))
ind_claw = union(ind_front_claw, ind_rear_claw)

## build cat texture
f = sin.(0.1 .* X[:,2]) .+ 1
f[ind_tail] .= -0.5
f[ind_head] .= -0.2
f[ind_claw] .= -1
f[ind_ear] .= 1
cat_plot(X; marker = f)
# save(".\\data\\cat8_texture_signal1.jld", "f", f)


for i = 1:3
    print(maximum(X[:,i]), ", ", minimum(X[:,i]), "; ")
end


### find out the problem with gplot() and plotlyjs()
# plotlyjs()
# G = LightGraphs.grid([11,10])
# N = nv(G)
# X = rand(N,3) .* 100

gplot(1.0*adjacency_matrix(G)[ind_head,ind_head], X[ind_head,:])


A = zeros(800,3)
A[:,1] = 1:800
A[:,2] = 801:1600
A[:,3] = 1601:2400
heatmap(rand(230,230))
