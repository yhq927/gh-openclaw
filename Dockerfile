FROM node:22-alpine

WORKDIR /app

# 基础依赖
RUN apk add --no-cache git bash

# 安装 OpenClaw（国内镜像）
RUN npm install -g openclaw@latest --registry=https://registry.npmmirror.com
RUN npm install -g @openclaw-china/channels --registry=https://registry.npmmirror.com

# 目录
RUN mkdir -p /app/config /app/memory /app/skills

EXPOSE 8080

CMD ["sh", "-c", "\
  openclaw init --force --config /app/config/openclaw.json && \
  openclaw gateway start --config /app/config/openclaw.json \
"]
