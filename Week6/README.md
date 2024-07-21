# Lecture 6

介绍了domain name system的概念。

A记录: 返回一个IPv4地址，例如 74.125.142.147。

AAAA记录: 返回一个IPv6地址，例如 2607:f140:0:32::70。

CNAME记录: 返回规范域名，例如 uptime.ocf.io 指向 stats.uptimerobot.com。

MX记录: 将邮件重定向到邮件服务器，例如 MX ocf.b.e 指向 aspmx.l.google.com 等。

NS记录: 存储域名的权威名称服务器，例如 ocf.io 的NS记录指向 ns1.o.b.e。

TXT记录: 包含关于域名的信息（例如站点验证等）。

SRV记录: 指定特定服务的主机和端口。

SOA记录: 存储关于域名的管理信息（如管理员的电子邮件地址、域名最后一次更新的时间以及服务器在刷新之间应等待的时间）。

TTL记录

- 生存时间（Time to live）
- 告诉DNS服务器或本地解析器应在其缓存中保存记录的时间
- 较长的TTL可以加快DNS解析速度，但会导致区域更新传播到用户所需的时间更长

# Lab 6

#### 问题 1a: 您使用什么命令来显示联网服务？

```
sudo apt update
sudo apt install net-tools
netstat -tuln
```

#### 问题 1b: 粘贴命令的输出。

以下是示例输出（具体输出会根据您的系统有所不同）：

```
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
tcp6       0      0 :::80                   :::*                    LISTEN
udp        0      0 0.0.0.0:123             0.0.0.0:*
udp6       0      0 :::123                  :::*
```

#### 问题 1c: 从输出中选择一项服务并描述它的作用。

例如，选择以下服务：

```
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
```

**描述**:

- 服务端口 22 (SSH)
  - **作用**: 该服务监听22端口，表示SSH（Secure Shell）服务正在运行。SSH是一种用于安全登录远程计算机的协议。通过SSH，用户可以在不安全的网络上安全地管理和操作远程计算机。
  - **用途**: 常用于远程登录服务器、执行命令以及传输文件等任务。SSH提供了加密的通信通道，确保数据在传输过程中不被窃听或篡改。

### Question 2a: 显示bind9是否正在运行的systemctl命令是什么？

```
sudo systemctl status bind9
```

这个命令会显示 `bind9` 服务的当前状态，包括是否正在运行。

### Question 2b: 为什么如果末尾不存在@localhost（如果bind9未启动），dig命令（dig ocf.berkeley.edu）可以工作，但在添加@localhost时会超时？

如果 `dig ocf.berkeley.edu` 没有添加 `@localhost`，它会使用系统配置的默认DNS服务器来解析域名。默认的DNS服务器通常是在 `/etc/resolv.conf` 文件中配置的外部DNS服务器。

当你使用 `dig ocf.berkeley.edu @localhost` 时，命令会直接查询本地运行的DNS服务器（bind9）。如果 `bind9` 没有启动或者没有正确配置，本地DNS服务器无法响应请求，因此会导致查询超时。

### Question 2c: 您在 DNS 服务器配置（db.example.com 文件）中添加了哪些附加条目？

假设 `db.example.com` 文件的基本内容如下：

```
$TTL    604800
@       IN      SOA     ns.example.com. root.example.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns.example.com.
@       IN      A       192.0.2.1
ns      IN      A       192.0.2.2
```

您可能添加了以下附加条目：

```
www     IN      A       192.0.2.3
mail    IN      A       192.0.2.4
ftp     IN      CNAME   www.example.com.
```

这些条目分别为：

- `www`：指向IP地址 `192.0.2.3` 的A记录。
- `mail`：指向IP地址 `192.0.2.4` 的A记录。
- `ftp`：作为 `www.example.com` 的别名的CNAME记录。

### Question 2d: 您使用什么命令向本地 DNS 服务器发出附加条目的请求？

你可以使用 `dig` 命令来请求本地DNS服务器的附加条目。例如：

```
dig @localhost www.example.com
dig @localhost mail.example.com
dig @localhost ftp.example.com
```

这些命令分别会查询 `www.example.com`、`mail.example.com` 和 `ftp.example.com` 的DNS记录，并通过本地运行的DNS服务器（即 `bind9`）进行解析。

