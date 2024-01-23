using Random
using LinearAlgebra
using Distributions
using ProgressMeter
using Plots

Random.seed!(1)

"""
    H atom
"""
function energy(r)
    return -1.0 / (norm(r))
end

function DMC_core!(box, walkers, Δt, E_o)
    for i in eachindex(walkers)

        dr = randn(3).* sqrt(Δt/3)
        walkers[i] += dr

        E_new = energy(walkers[i])
        p_accept = exp(-Δt * (E_new - E_o))

        if rand() < p_accept
            push!(box,walkers[i])
        else
            walkers[i] = sample(box)
        end
    end
end

function DMC_Integer(walkers,Step,E_guess,Δt)
    box = []
    E = E_guess
    N_Step = 0
    p = Progress(Step,1,"Mainly ")
    for i in 1:Step
        DMC_core!(box, walkers, Δt, E)
        l = length(walkers)
        N_Step += l
        ProgressMeter.next!(p; showvalues = sum(energy.(walkers)/l))
    end
    return box
end

N_walkers = 5000
steps = 2000
Δt = 0.01

box = DMC_Integer([rand(3).-0.5 for i in 1:1000],steps,-1,Δt)

l = zeros(length(box))
for i in 1:length(box)
    l[i] = norm(box[i])
end

# lx = zeros(length(box))
# ly = similar(lx)
# for i in 1:length(box)
#     lx[i] = box[i][1]
#     ly[i] = box[i][2]
# end

histogram(l)
# histogram2d(lx,ly)