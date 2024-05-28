# Lecture 3

Linux 发行版是一个由 Linux 内核、[GNU 工具](https://www.gnu.org/manual/blurbs.html)、附加软件和软件包管理器组成的操作系统，它也可能包括[显示服务器](https://linux.cn/article-12589-1.html)和[桌面环境](https://itsfoss.com/what-is-desktop-environment/)，以用作常规的桌面操作系统。

这个术语之所以是 “Linux 发行版”，是因为像 Debian、Ubuntu 这样的机构“发行”了 Linux 内核以及所有必要的软件及实用程序（如网络管理器、软件包管理器、桌面环境等），使其可以作为一个操作系统使用。

你的发行版还负责提供更新来维护其内核和其他实用程序。

所以，“Linux” 是内核，而 “Linux 发行版”是操作系统。

包裹是一个保有着二进制执行文件和应用程序的文档，同时也包含了关于操作系统的元数据，可以用来在系统上安装新软件，使用.deb的格式。

Debian是一种包裹管理，可以将它理解为Linux上的App store，但区别是Debian需要手动更新并且包裹可以依赖其他包裹。

同时介绍了一些包裹的内在信息分布。

/usr/bin/ 储存了包裹提供的可运行的文件。

/usr/share/ 则包含了documentation和manpage。

/etc 则包含了配置文件。

# Lab 3

介绍了如何用fpm打包一个自己的包裹，但我觉得泛用性不是很强。



