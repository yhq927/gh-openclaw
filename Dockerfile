FROM node:22-alpine
WORKDIR /app
RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g openclaw@latest @openclaw-china/channels
RUN mkdir -p /app/config /app/memory /app/skills
# 配置文件里给 OpenClaw 设 3000 端口，和 8080 不冲突
RUN echo '{ "gateway": { "port": 3000, "host": "0.0.0.0" } }' > /app/config/openclaw.json
# 复制启动脚本并赋予执行权限
COPY start.sh .
RUN chmod +x start.sh
EXPOSE 8080
# 用脚本启动
CMD ["./start.sh"]
