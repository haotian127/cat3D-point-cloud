using LightGraphs, Plots, JLD, Statistics

include("..\\src\\gplot.jl")
include("..\\src\\Centerized.jl")

G = loadgraph(".\\data\\cat8_simplified_vert503.lgz")
X = Centerized(load(".\\data\\cat8_simplified_vert503_xyz.jld", "xyz"))

scatter(X[:,1], X[:,2], X[:,3], aspect_ratio = 1)

gplot(1.0*adjacency_matrix(G), X); plot!(aspect_ratio = 1, xlims = [-100, 100], ylims = [-100, 100], zlims = [-100, 100])

for i = 1:3
    print(maximum(X[:,i]), ", ", minimum(X[:,i]), "; ")
end
