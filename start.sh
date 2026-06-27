#!/usr/bin/env bash
# 一键启动: 没有二进制就先编译, 端口由 TDX_PORT 控制(默认 8080)
set -e
cd "$(dirname "$0")"
if [ ! -x ./tdx-server ]; then
  echo "编译中 (主程序在 web/)..."
  (cd web && go build -mod=mod -o ../tdx-server .)
fi
echo "启动 TDX-API, 端口 ${TDX_PORT:-8080} → http://localhost:${TDX_PORT:-8080}"
exec ./tdx-server
