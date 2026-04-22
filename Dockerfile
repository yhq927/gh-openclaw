FROM node:22-alpine
WORKDIR /app

# 配置 npm 镜像
RUN npm config set registry https://registry.npmmirror.com

# 安装 OpenClaw 和 QQ 插件
RUN npm install -g openclaw@latest @openclaw-china/channels

# 创建必要目录
RUN mkdir -p /app/config /app/memory /app/skills

# 关键：直接把 QQ 配置写进配置文件（替换成你自己的信息！）
RUN echo '{
  "gateway": {
    "port": 3000,
    "host": "0.0.0.0"
  },
  "channels": {
    "qq": {
      "enabled": true,
      "accounts": {
        "main": {
          "appId": "1903879253",
          "appSecret": "68yb1DDzXrxpTt53"
        }
      }
    }
  }
}' > /app/config/openclaw.json

# 新建启动脚本，同时启动端口检测和 OpenClaw
COPY start.sh .
RUN chmod +x start.sh

EXPOSE 8080
CMD ["./start.sh"]
