# 使用 Node.js 22 官方镜像
FROM node:22-alpine

# 设置工作目录
WORKDIR /app

# 配置 npm 国内镜像源
RUN npm config set registry https://registry.npmmirror.com

# 安装 OpenClaw 和 QQ 渠道插件
RUN npm install -g openclaw@latest @openclaw-china/channels

# 创建持久化目录
RUN mkdir -p /app/config /app/memory /app/skills

# 暴露端口
EXPOSE 8080

# 用环境变量指定端口（OpenClaw 会自动读取）
ENV PORT=8080
ENV OPENCLAW_GATEWAY_PORT=8080

# 启动命令：去掉不支持的 --port 参数
CMD ["openclaw", "gateway", "start"]
