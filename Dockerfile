# 用官方 OpenClaw 镜像作为基础
FROM ghcr.io/openclaw-ai/openclaw:latest

# 设置工作目录
WORKDIR /app

# 安装 QQ 渠道插件
RUN npm install -g @openclaw-china/channels --registry=https://registry.npmmirror.com

# 创建持久化目录
RUN mkdir -p /app/config /app/memory /app/skills

# 暴露端口
EXPOSE 8080

# 设置端口环境变量
ENV PORT=8080

# 启动命令（用官方推荐的方式启动，自动初始化+监听端口）
CMD ["openclaw", "gateway", "start", "--port", "8080"]
