using LightGraphs, Plots, JLD

include("..\\src\\gplot.jl")

G = loadgraph(".\\data\\cat8_simplified_vert503.lgz")
X = load(".\\data\\cat8_simplified_vert503_xyz.jld", "xyz")

scatter(X[:,1], X[:,2], X[:,3], aspect_ratio = 1)
