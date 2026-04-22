# 使用 Node.js 22 官方镜像（满足版本要求）
FROM node:22-alpine

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

# 设置环境变量，强制端口和运行模式
ENV PORT=8080
ENV NODE_ENV=production

# 关键：用 openclaw start 直接前台运行，不依赖 systemd
CMD ["openclaw", "start"]
