# Lecture 4

介绍了进程和协议，进程的部分基本都学过。

有关于协议，我对它的理解是一种静态的非交互式的背景进程，它通常服务于系统。

它被长时间运行并且可以被多用户共享。

Systemd是一个管理进程和协议的初始系统。

# Lab 4

systemctl --type=service 查看当前正在运行的协议

- systemctl start [name] - 开始协议
- systemctl stop [name] - 停止协议
- systemctl restart [name] - 重新启动协议
- systemctl reload [name] - 重新加载协议
- systemctl enable [name] - 设置协议
- systemctl disable [name] - 与上面一个相反

问：systemctl restart和systemctl reload的区别是什么？

答：

systemctl reload：重新加载服务的配置文件，而不停止服务。适用于更新配置文件而不需要服务中断的情况。

systemctl restart：停止并重新启动服务。适用于需要完全重新启动服务以应用更改或解决问题的情况，会导致服务的短暂中断。

https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files
一篇关于如何撰写service的文档。



