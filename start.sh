#!/bin/sh
# 启动端口检测服务，让 Render 能检测到 8080 端口
node -e "require('http').createServer((req,res)=>res.end('ok')).listen(8080, '0.0.0.0', ()=>console.log('Port 8080 listening'))" &

# 启动 OpenClaw，自动加载我们写好的配置
openclaw start --config /app/config/openclaw.json
