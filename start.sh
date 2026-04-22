#!/bin/sh
# 先启动一个简单的 HTTP 服务，监听 8080 端口，让 Render 检测到
node -e "require('http').createServer((req,res)=>res.end('ok')).listen(8080, '0.0.0.0', ()=>console.log('Port 8080 listening'))" &

# 后台启动 OpenClaw（注意用配置文件指定端口，前台的脚本已经占了 8080，这里用 3000，不冲突）
openclaw start --config /app/config/openclaw.json
