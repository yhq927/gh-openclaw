FROM node:22-alpine
WORKDIR /app

# 加速安装
RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g openclaw@latest @openclaw-china/channels

# 创建配置目录
RUN mkdir -p /app/config

# 直接写死配置文件，强制端口 8080（不会报错！）
RUN echo '{ "gateway": { "port": 8080 } }' > /app/config/openclaw.json

EXPOSE 8080

# 正确启动（前台运行，不使用任何报错参数）
CMD ["openclaw", "start", "--config", "/app/config/openclaw.json"]
