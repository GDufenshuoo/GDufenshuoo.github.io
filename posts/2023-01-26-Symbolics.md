+++
title = "Symbolics"
hascode = true
rss = "Symbolics"
rss_title = "Symbolics"
rss_pubdate = Date(2023, 1, 26)

tags = ["Symbolics"]
+++

# Symbolics.jl

在这里介绍一个符号推理 pkg: Symbolics.jl 
具有十分强大的功能，这里主要关注他对函数的符号化。

## 功能：优化代码
在以下实例中，函数 `EInter(x,β,k)`[^1] 通过构造代数化函数得到了 1000x[^2] 的提升。
[^1]: β, k 为常数
[^2]: 当然会与基本代码的优化有关，但是（尤其是代数并行化之后）加速仍将十分可观。
### 基本代码
```julia
julia> using BenchmarkTools
julia> X=rand(3,10,5)
julia> EInter(x,β,k)
-8.527759190053775 

julia> @benchmark EInter(X,β,k)
BenchmarkTools.Trial: 10000 samples with 1 evaluation.
 Range (min … max):  84.300 μs …  5.042 ms  ┊ GC (min … max): 0.00% … 97.45%
 Time  (median):     89.700 μs              ┊ GC (median):    0.00%        
 Time  (mean ± σ):   97.487 μs ± 77.455 μs  ┊ GC (mean ± σ):  1.32% ±  1.69%
 Memory estimate: 23.38 KiB, allocs estimate: 1283.
```
### 代数化函数并特化代码

相当轻松自如，我们可以花费 `16.599 ms (122656 allocations: 6.36 MiB)` 来得到一个符号化之后的函数表达式。

这给我们带来了相当大的提升，比 GPU 并行化提升还要巨大，更不必说应用 GPU 等并行技术之后。
```
julia> using Symbolics
julia> @variables P[1:3, 1:10, 1:5]
julia> @btime EInter(collect(P),β,k)
  16.599 ms (122656 allocations: 6.36 MiB)
0.9416666666666667(abs2(P[1,100,1]-P[1,1,1])+abs2(P[1,100,2]-P[1,1,2])...

julia> f(x) = 0.9416666666666667(abs2(P[1,100,1]-P[1,1,1])+abs2(P[1,...
julia> f(X)
-8.527759190053775

julia> @benchmark f(P)
BenchmarkTools.Trial: 10000 samples with 949 evaluations.
 Range (min … max):   93.783 ns …  3.939 μs  ┊ GC (min … max): 0.00% … 97.07%
 Time  (median):     101.054 ns              ┊ GC (median):    0.00%
 Time  (mean ± σ):   107.397 ns ± 57.156 ns  ┊ GC (mean ± σ):  0.71% ±  1.37%
 Memory estimate: 16 bytes, allocs estimate: 1.
```
### 进一步简化表达式

进一步优化往往十分费时费力 `2.360 s (14534168 allocations: 731.25 MiB)` 几乎相当于上一步的 `100x` ，这里不是十分推荐，而且几乎不会有什么提升，但是理论上还可以进一步提升速度（逼近理论上的极限）。
```
julia> @btime simplify.(EInter(collect(P),β,k))
  2.360 s (14534168 allocations: 731.25 MiB)
0.008333333333333304(abs2(P[1, 100, 1] - P[1, 1, 1]) + abs2(P[1, 100, 2]...

julia>g(x)=0.008333333333333304(abs2(P[1,100,1]-P[1,1,1])+abs2(P[1,100,2]...
julia> g(X)
-8.527759190053775

julia> @benchmark g(P)
BenchmarkTools.Trial: 10000 samples with 947 evaluations.
 Range (min … max):   90.919 ns …  3.985 μs  ┊ GC (min … max): 0.00% … 97.45%
 Time  (median):      97.888 ns              ┊ GC (median):    0.00%       
 Time  (mean ± σ):   103.401 ns ± 55.237 ns  ┊ GC (mean ± σ):  0.73% ±  1.38%
 Memory estimate: 16 bytes, allocs estimate: 1.
```

### 缺点

我遇到的缺点就是：符号化之后的代码编译起来有点慢。

