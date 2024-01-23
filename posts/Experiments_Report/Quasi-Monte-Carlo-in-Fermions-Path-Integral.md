+++
title = "Examination of the Quasi-Monte Carlo (QMC) Method for EFFECT Path integral for fermions method to calculate 4 electrons in 2D trap"
hascode = true
rss = "Examination of the Quasi-Monte Carlo (QMC) Method for EFFECT Path integral for fermions method to calculate 4 electrons in 2D trap"
rss_title = "Examination of the Quasi-Monte Carlo (QMC) Method for EFFECT Path integral for fermions method to calculate 4 electrons in 2D trap"
rss_pubdate = Date(2023, 4, 1)
tags = ["fermions", "Method", "Quasi-Monte-Carlo"]
+++

# Title: Examination of the Quasi-Monte Carlo (QMC) Method for EFFECT Path integral for fermions method to calculate 4 electrons in 2D trap

## Date: April 1, 2023

## Abstract: 
We explored the use of the Quasi-Monte Carlo (QMC) method, specifically employing the Sobol sequence, for calculating the energy levels of a system of four electrons in a two-dimensional trap. Our experiment utilized the EFFECT Path Integral method for fermions, and the results indicated that the QMC method is not well-suited for this problem.

## Introduction:

The EFFECT Path Integral method is an advanced numerical technique employed for studying the behavior of fermionic systems. In this experiment, we aimed to investigate the applicability of the Quasi-Monte Carlo (QMC) method, specifically using the Sobol sequence, for a problem involving four electrons in a two-dimensional trap.

## Methodology:

We implemented the Sobol sequence, a well-known low-discrepancy sequence, as the QMC method in our experiment. Our problem required calculating energy levels based on a Hamiltonian function that incorporated potential energy, electron-electron interactions, and fermionic simulations. We used the Julia programming language and the ForwardDiff package for automatic differentiation.

The experiment comprised 10,000 energy calculations with varying input parameters from the Sobol sequence. We subsequently analyzed the distribution of energy values and computed the mean energy per particle.

## Results:

Our analysis revealed that the QMC method led to unsatisfactory results in this case. A significant portion of the energy calculations resulted in infinite values, indicating that the method was ill-suited for this problem. Although we filtered out the infinite values and computed the mean energy per particle, this metric was unreliable due to inconsistencies in the energy distribution.

## Conclusion:

Based on our experimental findings, we conclude that the Quasi-Monte Carlo method, specifically using the Sobol sequence, is not suitable for the problem of calculating energy levels for four electrons in a two-dimensional trap using the EFFECT Path Integral method for fermions. Further investigation and alternative numerical approaches should be explored to obtain more accurate and reliable results.

### --By ChatGPT-4

# code:
```julia
using Sobol
using LinearAlgebra
using Statistics

"""
H
"""
function 𝐻(lβ,X)
    x = reshape(X,2,B,N)
    return 0.5*𝑈(x)/B + ⋓(x,λ)/B + 𝑇ᴱ(x,lβ)
end

function 𝑈(x)
    U = 0.0
    U += sum(abs2,x)
    return U
end

function ⋓(x,λ)
    U = 0.0
    for i in 2:N, j in 1:i-1, b in 1:B
        U += λ/sqrt(sum(abs2,x[:,b,i].-x[:,b,j]))
    end
    return U
end

"""
# The part to simulate fermions
"""
function 𝑇ᴱ(x,β)
    T = 0.0
    k = -0.5*B/β
    for b in 1:B
        T += AD(x,b,k)
    end
    return log(T^2)/(2k*β)
end

"""
Under developing
"""
function AD(x,b,k)
    A = zeros(Real,N, N)
    L = (b == 1 ? B : b-1)
    for i in 1:N
        for j in 1:N
            A[i,j] = exp(k*sum(abs2,x[:,L,i].-x[:,b,j]))
        end
    end
    return det(A)
end

"""
### get the 𝑝
"""
function 𝑝(a,b)
    p = 0.0
    for i in 1:3
        p += (a[i]-b[i])^2
    end
    return p
end

N = 4
B = 45
β,λ = 10,0.5

"""
0.8557738245641116  1.496618732289386   0.36831328304100563
0.8780146128345013  1.5198062019013956  0.6368870236646227
"""

n = 10^2
s = SobolSeq(2*B*N)

skip(s, n)
x = next!(s)

using ForwardDiff
Ene(X) = 𝐻(β,X)# + β*ForwardDiff.derivative(β->𝐻(β,X),β)


E = []
for i in 1:10000
    next!(s, x)
    p = (x.-0.5)*6
    push!(E,Ene(p))
end

Ep = []
for i in eachindex(E)
    if E[i] != Inf
        push!(Ep,E[i])
    end
end

# Get the distribution
EEp = exp.(Ep)
EEp ./= sum(EEp)
sum(Ep.*EEp)/(β*N)

mean(Ep)/(β*N);

# minimum(E)
# maximum(E)
# A = E./sum(E) 
# minimum(A)
# maximum(A)

```