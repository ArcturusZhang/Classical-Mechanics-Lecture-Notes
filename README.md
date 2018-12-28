# 经典力学讲义

这是我对本科《经典力学》课程讲义的总结，加上一些看马尔契夫《理论力学》的笔记。水平有限，疏漏在所难免，欢迎提交PR~

## 源文件说明

- 文件CM_chs.pdf是讲义最新的pdf文档
- 文件CM_chs.tex是讲义的tex源文件
- chapter文件夹内保存了各章节的tex文档

## 编译说明

需要安装任意LaTeX发行版（推荐使用[TeX Live](http://mirror.lzu.edu.cn/CTAN/systems/texlive/Images/)）和[Asymptote](https://sourceforge.net/projects/asymptote/)，并在LaTeX发行版中安装asymptote宏包（TeX Live中应该默认已经包含了asymptote宏包，因此不需要额外操作）。

可能还需要安装[Ghostscript](https://www.ghostscript.com/download/gsdnld.html)才能使Asymptote能够正常生成PDF文件。

编译时需要顺序执行以下命令：

    xelatex CM_chs.tex
    asy CM_chs-*.asy
    xelatex CM_chs.tex
    xelatex CM_chs.tex

其中的asy命令由于文稿中图片很多，可能需要花费很多时间（视电脑性能不同可能需要20分钟至1小时），如果图片没有修改，可以跳过asy命令直接编译文档以节约时间。
