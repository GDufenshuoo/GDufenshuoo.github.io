+++
title = "What's wrong with DFT method?"
hascode = false
rss = "What's wrong with DFT method? \n --It's DFT."
rss_title = "DFT method"
rss_pubdate = Date(2022, 9, 26)

tags = ["DFT", "Method"]
+++

众所周知，DFT 好用，但也不那么好（good enough）用。

# I. B-O 近似
# II. K-S 方程
## 1. DFT 将一个相互作用的系统，转化成了非相互作用的系统
密度泛函理论最普遍的应用是通过Kohn-Sham方法实现的,在Kohn-Sham DFT的框架中，复杂的多体问题（由于处在一个外部静电势中的电子相互作用而产生的）被简化成一个没有相互作用的电子在有效势场中运动的问题。这个有效势场包括了外部势场以及电子间库仑相互作用的影响，例如交换和关联作用。（copy from wiki）
>In physics and quantum chemistry, specifically density functional theory, the Kohn–Sham equation is the non-interacting Schrödinger equation (more clearly, Schrödinger-like equation) of a fictitious system (the "Kohn–Sham system") of non-interacting particles (typically electrons) that generate the same density as any given system of interacting particles. The Kohn–Sham equation is defined by a local effective (fictitious) external potential in which the non-interacting particles move, typically denoted as vs(r) or veff(r), called the Kohn–Sham potential. If the particles in the Kohn–Sham system are non-interacting fermions (non-fermion DFT has been researched), the Kohn–Sham wavefunction is a single Slater determinant constructed from a set of orbitals that are the lowest-energy solutions to
>$$ \left(-\frac{\hbar^2}{2m}\nabla^2 + v_\text{eff}(\mathbf r)\right) \varphi_i(\mathbf r) = \varepsilon_i \varphi_i(\mathbf r) $$

（实际上我认为这只是提供了一个近似，把很难准确计算的部分“扫到了地毯下面”然后拿出一个泛函来代替（代价是什么呢））

代价是我们拿不到准确的能量，无论是基态的还是所谓的占据轨道与未占据轨道的。并且精度十分依赖所谓的交换关联势。

## 2. 系统的总能量表示为电荷密度的泛函
不可区分粒子对于现实世界有许多“好处”，但对计算来说不太友善（搞不出好(very sample)的模型）

系统的总能量表示为电荷密度的泛函好的一点在于，符合电子不可区分的性质，不过也导致了所谓的交换关联势，而不是交换势和关联势。

系统的总能量表示为电荷密度的泛函不好的一点在于，严格上结果只代表所求系统基态，激发态比较难（QMC 也是如此，
不过 PIMC 有个解决方法（困难被统一于所谓符号问题（属于震荡函数积分问题）））。

## 3. K-S 轨道能量几乎没有物理意义
$$
E = \sum_i^N \varepsilon_i - E_\text{H}[\rho] + E_\text{xc}[\rho] - \int \frac{\delta E_\text{xc}[\rho]}{\delta\rho(\mathbf r)} \rho(\mathbf{r}) \,d\mathbf{r}
$$

很明显这里面根本没有出现 H-F 所定义的一般意义上代表电子占据情况的轨道(我一直很反对轨道的概念，我觉得根本没有这个东西)

这个是我们算激发态的时候困难重重的直接原因。

以上只是我的一些感想对于具体的问题**我的建议是直接看** [量化砖头](https://raw.githubusercontent.com/GDufenshuoo/GDufenshuoo.github.io/master/files/%E9%87%8F%E5%8C%96%E7%A0%96%E5%A4%B4%E2%80%94%E2%80%94%E9%87%8F%E5%AD%90%E8%AE%A1%E7%AE%97%E5%BF%85%E9%A1%BB%E8%AF%BB%E6%87%82%E7%9A%84%E8%B5%84%E6%96%99.pdf)

