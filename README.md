# 经典力学讲义

## 源文件说明

- 文件CM_chs.pdf是讲义最新的pdf文档
- 文件CM_chs.tex是讲义的tex源文件
- chapter文件夹内保存了各章节的tex文档

## 编译说明

编译需要安装asymptote宏包。

编译时需要顺序执行以下命令：

    xelatex CM_chs.tex
    asy CM_chs-*.asy
    xelatex CM_chs.tex
    xelatex CM_chs.tex

其中asy命令由于文稿中图片很多，可能需要花费很多时间（在我的笔记本电脑上需要耗时一个小时）。但如果只有个别图片修改可以选择性编译修改过的图片以节约时间。
