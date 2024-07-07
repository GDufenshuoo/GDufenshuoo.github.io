+++
title = "旧量子论的故事 Story about Old Quantum Theory"
hascode = true
rss = "旧量子论的故事 Story about Old Quantum Theory"
rss_title = "旧量子论的故事 Story about Old Quantum Theory"
rss_pubdate = Date(2024, 7, 6)
tags = ["Quantum"]
+++

\newcommand{\figenv}[3]{
~~~
<figure style="text-align: center; margin: 0;">
    <img src="!#2" style="display: block; margin: 0 auto; padding: 0; #3" alt="#1"/>
    <figcaption style="text-align: center; margin-top: 10px;">#1</figcaption>
</figure>
~~~
}

\newcommand{\figcaptioncenter}[2]{
~~~
<figcaption style="text-align: center; margin-top: 10px;#2">#1</figcaption>
~~~
}

\newcommand{\front}[2]{
~~~
<text style="#2">#1</text>
~~~
}

# 旧量子论的故事 Story about Old Quantum Theory

## 写在一切之前的序

量子，Quantum, 先进而 fancy 的代表。量子力学自问世以来已百余年，虽然对于许多理论来说已经足够有资历了，但是相比于经典力学来说还稍显青涩[^P_1]。

在经过比较粗浅的学习过程之后，笔者 [^P_2] 仍然对量子论的概貌感到糊涂。在上个月有幸听了曹则贤老师于吉林大学关于黑体辐射的讲座，有感而发，于是决定效仿曹则贤老师来一次追本溯源。 [^P_3]

## 经典力学的早期量子化——基于轨道的修修补补
\figenv{}{/assets/posts/OldQuantumTheory_D.ter Haar.png}{width:50%; border: 1px solid black;}
\figcaptioncenter{Old Quantum Theory by D.ter Haar}{font-family: "Times New Roman", Times, serif; font-style: italic;}
<!-- ~~~
<figcaption style="text-align: center; margin-top: 10px;font-family: "Times New Roman", Times, serif; font-style: italic;">大家</figcaption>
~~~ -->

旧量子化有点后来者的意味，在当时，量子化好比如今的可控核聚变一样是十分先驱的工作。而这经典力学早期量子化的历程，依旧要从我们熟悉的量子化先驱——普朗克（Max Planck）开始。

1900年普朗克发表了关于黑体辐射光谱公式中波长与温度的关系，并使用量子化解释了相关公式。[^1]
虽然后来可以证明——由普朗克本人也由其他人试图证明这样的量子化并不是必须的。实际上，能够从大约二十多种方法推导出黑体辐射公式。[^2] [^5]
不过这启发了另一位物理巨擘阿尔伯特·爱因斯坦（Albert Einstein）在量子化上的一系列工作，最终帮助建立了量子力学的半壁江山。[^3]

暂且不提量子论的起源，单单从轨道量子化出发，就有一大堆故事。

### 轨道与轨道量子化 以及玻尔-索末菲模型

原子中轨道的概念是谁提出的，也许会有一大堆人吧，但是从科学意义上 John William Nicholson 创建的原子论被 Bohr 在他 1913 年 "On the constitution of atoms and molecules" 一文中引用，由此可以认为是最先提出。[^4]
在原子轨道模型中，电子只能在特定的轨道上运行，虽然有点违反经典物理常识，但这种简单而粗暴的量子化方法应用在氢原子中效果不错，而且关于量子化的讨论已经比较完善[^5] ，最重要的是在次年 Franck-Hertz 实验结果完美证实了原子轨道模型。[^6][^7]

Franck 和 Hertz 设计了一种用于研究高能电子的真空管。当电子飞过稀薄的汞原子蒸气，与汞原子发生碰撞时，只会损失特定量（4.9电子伏特）的动能，然后飞走，证实了原子轨道的量子化。

接下来
索末菲大师 （Arnold Sommerfeld）
登场。索末菲利用洛伦兹（Lorentz）和爱因斯坦引入的量子数绝热不变性原理，将量子规则扩展到任意可积系统，引入角量子数 [^8] ，当时被称为 “空间量子化”（space quantization, Richtungsquantelung in German），提出了 Bohr–Sommerfeld model。在玻尔-索末菲模型中索末菲使用了William Wilson的角量子化条件，角动量只能是普朗克常数的整数倍。

\figenv{}{/assets/posts/Atombau_1922_p_367-2.png}{width:50%; border: 1px solid black;}

在这个表述下，关于量子的许多问题都得到了解决，关于振动与转动光谱的各种计算，甚至索末菲解释了相对论性氢原子的部分性质，由于没有引入电子的自旋量子化，还帮助了电子自旋的发现。

但是这样的表述下大多数轨道计算是合理的——除了轨道尖锐的拐点。Hendrik Kramers 通过将轨道的傅里叶系数解释为强度来计算了索末菲模型中谱线的相对强度，不过仍然只有部分结果正确。

这种量子化问题在于没有描述依赖于时间的过程，例如辐射的发射或吸收。

### 突如其来的矩阵力学

“旧量子论”到这里就差不多了，因为接下来海森堡（Werner Heisenberg）的矩阵力学更加简洁。与 Hendrik 的合作中海森堡意识到跃迁概率并不是非常经典的量，在矩阵力学中，系数矩阵替换了经典的傅里叶级数来给出辐射强度。随后海森堡将论文交给 Max Born，然后与 Born 的助手 Pascual Jordan 一同联名发表了矩阵力学。

不过，还是稍等一下。

旧量子论相比之下局限性在何处？毕竟要是局限性比较小，修修补补或许还能用。

1. 旧的量子论计算谱线的强度存在缺陷。必须忽略某些轨道。
2. 无法量化混沌系统。混沌系统轨道既不封闭，也没有周期性。
3. 在不同的坐标系下有时会给出不同的答案。

然后 Bohr–Kramers–Slater (BKS) theory 理论做了旧量子论的最后一次尝试。然后 Bothe–Geiger coincidence experiment 成功发现证明了光子的存在、能量守恒和康普顿散射理论。而由于BKS理论认为能量守恒是统计性质，啪，致命一击，旧量子论被终结了。

### 结束？

结束就是这么突然。

爱因斯坦更关注能量和动量守恒的证实，1924 年 4 月 29 日，在与 Hedwig Born 的信中说道：

> "Bohr's opinion of radiation interests me very much. But I don't want to let myself be driven to a renunciation of strict causality before there has been a much stronger resistance against it than up to now. I cannot bear the thought that an electron exposed to a ray should by its own free decision choose the moment and the direction in which it wants to jump away. If so, I'd rather be a cobbler or even an employee in a gambling house than a physicist. It is true that my attempts to give the quanta palpable shape have failed again and again, but I'm not going to give up hope for a long time yet."“玻尔对辐射的看法让我非常感兴趣。但我不想在遇到比目前更大的阻力之前放弃严格的因果性。我无法忍受这样一种想法：一个暴露在射线中的电子可以凭自己的自由决定选择跳跃的时刻和方向。如果是这样，我宁愿成为一个鞋匠，甚至是赌场的雇员，也不愿成为一个物理学家。确实，我试图赋予量子具体形态的努力一次又一次地失败了，但我不会很快放弃希望。”

玻尔得知实验后也不得不对 Charles Galton Darwin 说道：
>"there is nothing else to do than to give our revolutionary efforts as honourable a funeral as possible"

后来物理世界仍然很热闹，毕竟光是怎么来的？马克斯·普朗克在1911年说道：
> "Mr. Einstein, it would be necessary to conceive … [of] light waves themselves as atomistically constituted, and hence to give up Maxwell's equations. This seems to me a step which in my opinion is not yet necessary…. I think that first of all one should attempt to transfer the whole problem of the quantum theory to the area of the interaction between matter and radiation." “爱因斯坦先生，如果必须考虑将光波本身看作原子式构成，那么就必须放弃麦克斯韦方程。这在我看来是目前还不必要的一步。我认为首先应该尝试将整个量子理论的问题转移到物质和辐射之间的相互作用领域。”

后来光与物质的相互作用后来催生了量子场论，开启了新的高能物理时代。

### 还有？路径积分 EBK 量子化混沌系统？旧量子论与半经典方法？

不过，稍等一下下，笔者仍然意犹未尽，这时候，就不得不再提一嘴路径积分了[^9] ，轨道的概念在路径积分中得到了抽象，其中量子化自然而然通过轨道的相位闭合实现，和新的量子论一样好，甚至更好——在量子场论中大放异彩。

1950 年代，约瑟夫·凯勒 （Joseph Keller） 使用爱因斯坦对 1917 年的解释更新了玻尔-索末菲量子化，称为 Einstein–Brillouin–Keller (EBK) method。该理论工作良好，甚至能计算氢原子的相对论性精细结构。实际上该方法仍然在不断取得进展。

1971年，马丁·古茨维勒（Martin Gutzwiller）从路径积分中推导出了一种量子化混沌系统的半经典方法。

旧量子论依然以“半经典方法”的方式继续发光发热。

### 声明

! 本文大量参考[wikipedia]()

### 注

[^P_1]: 量子力学在这100年里发展迅速，青涩已经不太妥当，但是相比之下经典力学依旧显得更为老成。
[^P_2]: 笔者，这可是作为作家才能有的自称。
[^P_3]: 曹则贤老师的讲座有两天。第一次讲座在开始之后才得知，第二次讲座于线上听完了全程。不太好意思去现场，现在感觉还是比较后悔的。
[^1]: 黑体辐射的相关故事在曹则贤老师的《黑体辐射——会下物理金蛋的鹅》书中有精彩的表述，其中黑体辐射的研究本身自1860年至1928年均有大量研究与讨论。
[^2]: 就像从诸多道路汇入伫立在尽头的罗马，热力学总是显得更加基本。
[^3]: 爱因斯坦在黑体辐射上投入与产出在一众参与研究的科学家中是最多的，其原文内涵远远无法用几句话来代替。同时爱因斯坦本人的工作也非读原文无法领略其神韵与大部分结论。
[^4]: John William Nicholson 在1910 年提出了原子轨道模型，不过由于其偏向天文，由于学科间的壁垒没有被广泛承认为原子轨道的提出者。美国物理学史学家 John William Nicholson 为其写了一本书 "The Atomic Theory of John William Nicholson"。
[^5]: 1911 年庞加莱使用相空间证明了普朗克黑体辐射定律与量子化间互为充分必要条件，结束了量子化的争端——结束了普朗克的怀疑。
[^6]: 很明显在引用文献时只选取了最近的（而且从某种意义上最好找的）原子模型文献。
[^7]: 1926 年 12 月 10 日，Franck 和 Hertz 被授予 1925 年诺贝尔物理学奖，"for their discovery of the laws governing the impact of an electron upon an atom"。本文中的著名科学家（索末菲大师 Arnold Sommerfeld 例外）均获得过此奖。
[^8]: 以及磁量子数和精细结构常数。
[^9]: 有的时候真的觉得这是否是一种职业病。