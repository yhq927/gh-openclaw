# 使用 Node.js 20 官方镜像（稳定、Render 支持最好）
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 配置 npm 国内镜像源，避免安装超时
RUN npm config set registry https://registry.npmmirror.com

# 安装 OpenClaw 和 QQ 渠道插件
RUN npm install -g openclaw@latest @openclaw-china/channels

# 创建持久化目录
RUN mkdir -p /app/config /app/memory /app/skills

# 暴露端口
EXPOSE 8080

# 设置环境变量，强制监听 8080 端口
ENV PORT=8080
ENV OPENCLAW_GATEWAY_PORT=8080

# 启动命令：跳过 init，直接启动网关并指定端口
CMD ["openclaw", "gateway", "start", "--port", "8080"]
