+++
title = "Path integral for fermions"
hascode = true
rss = "Path integral for fermions"
rss_title = "Path integral for fermions"
rss_pubdate = Date(2023, 2, 25)
tags = ["fermions", "Method"]
+++

<!-- # Path integral for fermions -->

# EFFECTIVE Path Integral for fermions

For seeking and searching and thinking and on, with many thoughts passed by,
IT occured to me that THE METHOD maight be the EFFECTIVE way to simulate fermions:

With the Method of well known the Slater determinant wavefunction, 
I put it `𝔣` (means ferminic) in solving a single TIME Slice free move part `⟨ ψ|eᵝᵀ|ψ ⟩`.

With ferminic free Move particle `⟨ ψ|𝔣eᵝᵀ|ψ ⟩` 
(ferminic T is not necessary, ferminic `U` might be fine according to the original thought of *Feyman*),
the Path integral just like the classical one, but it works.

Solving the 2D trap[^1] ![](/assets/posts/PIforFermions3.png)

![](/assets/posts/PIforFermions2.png)

I use 45 Time Beads and get 10000\*2\*45\*6 points.

It should be ![](/assets/posts/PIforFermions.png)

I got ![](/assets/posts/PIforFermionsRes.png)

[^1]: Schoof, Tim. “Configuration Path Integral Monte Carlo :ab initio simulations of fermions in the warm dense matter regime.” (2017).

## After several tests, It might be great although still unstable.[^2]

### good samples
![](/assets/posts/PIforFermionsRes.svg)
![](/assets/posts/PIforFermionsRes2.svg)
![](/assets/posts/PIforFermionsRes3.svg)
![](/assets/posts/PIforFermionsRes6.svg)

### not good samples

![](/assets/posts/PIforFermionsRes4.svg)
![](/assets/posts/PIforFermionsRes5.svg)
![](/assets/posts/PIforFermionsRes7.svg)

[^2]: By the way It only cost about 10mins per test using `PathFinder.jl` & "interaction" is not suitable

