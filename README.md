## Elico-tools

该仓库用来记录一些用于插件开发和仿真环境部署相关的工具等。

### 目录结构

```bash
├── Daemon											# Daemon相关脚本
│   └── pluginLog.py							# 用于python日志记录
├── fonts												# 仿真用字体
├── .vscode											# java调试用launch和task文件
├── service											# 自定义的service服务
│   ├── README.md								
│   ├── x11vnc.service						# x11vnc service
│   └── xvfb.service							# xvfb service
├── shell												# 自用的shell脚本
│   ├── function.sh								# 常用的自定义函数
│   └── setup.sh									# 从一个linux虚拟机部署环境
└── tools												# 一些工具脚本
    └── run_elisim.py							# 将该脚本放到Sim集合目录,并设置对应的全局命令,可以方便的进入仿真
```

