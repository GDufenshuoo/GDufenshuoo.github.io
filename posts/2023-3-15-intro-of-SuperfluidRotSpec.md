+++
title = "SuperfluidRotSpec.jl"
hascode = true
rss = "SuperfluidRotSpec"
rss_title = "SuperfluidRotSpec.jl"
rss_pubdate = Date(2023, 3, 15)
tags = ["Bonsons","fermions", "Method", "Superfulid", "HMC"]
+++

# SuperfluidRotSpec.jl

设计 SuperfluidRotSpec.jl 的时候主要目的是利用 HMC 等贝叶斯推断工具，使用 Julia 自动微分，并行工具来解决不可区分原子/分子的超流问题。

实际上由于采样器解决问题时的重要地位，实际上程序只需要写 `哈密顿量` 和 `HMC 接口` 这两个部分。导致这个包其实体量不大，但是我觉得有效就行。

## Model

该程序定义了如下的 Model

### rotor in superfulid


### Atomic


### 
