+++
title = "Read data from SVG/PDF Figure"
hascode = true
rss = "Read data from SVG/PDF Figure"
rss_title = "Read data from SVG/PDF Figure"
rss_pubdate = Date(2024, 10, 21)
tags = ["Quantum"]
+++


## 前言

组会上老师提出需要把图表中的数据提取出来这样的任务（属于是一种赛博体力活），根据常年使用PDF编辑器裁切需要的矢量图的经验[^1]，
作为矢量图，必然是有精确的空间信息，再加上应该没人会无聊到加密图形，加上个位移量上去什么的，那从SVG/PDF图表中提取数据不是很合理嘛。
简单搜索一下，发现确实有这么一个还在积极维护的 Python[^2] Pkg， 就是下面要介绍的：



# [svgdigitizer](https://github.com/echemdb/svgdigitizer)

在这里简要介绍一下[^3]。

除了着重强调的也是我们最关心的 

**extracts metadata associated with the plot in the SVG** 

当然还有许多其他功能，看LOGO! 奇奇怪怪的图（如图）大约也是能提取的。

    ![](/assets/posts/Codes/SVG_Figure/logo.png)

### [从PDF中提取](https://echemdb.github.io/svgdigitizer/usage.html)

1. 变PDF为SVG：使用 svgdigitizer 命令行输入 `svgdigitizer paginate Figure_name.pdf` 从 PDF 中创建 SVG。

    官网给了一个离谱的例子（）

    ![](/assets/posts/Codes/SVG_Figure/example_plot_p0.png)

    能转换的图最低要：理论上每个坐标轴至少得有两个标数字的刻度线，曲线呢得是 bezier path 可以描绘的，这里应该是指光滑。

    然后结果是这样的：

    ![](/assets/posts/Codes/SVG_Figure/looping_annotated.png)

    我觉得应该不需要说什么了，完美！

2. 描绘曲线（由于博主关注散点图，这个略去了）

    简而言之就是自己在这条离谱的图像曲线上，放几个关键点来用贝塞尔曲线能画出来，也就是 digital 数字化。请看他的[文档](https://echemdb.github.io/svgdigitizer/usage.html#curve-tracing)。

总之最后的结果：

![](/assets/posts/Codes/SVG_Figure/results.png)


先写到这里，非常好，爱来自加班。


[^1]: 实际上有些图都把文章其它部分裁进去了，只不过在边界外（这就是为什么文档会大那么多hhh）所以也没管()。
[^2]: 不是Python才会觉得意外吧。
[^3]: 其实官网介绍的很详细了，但是水一水嘛。