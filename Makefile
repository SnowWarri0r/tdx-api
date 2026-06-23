# TDX-API 构建 (主程序在 web/ 子模块, 根目录是 injoyai/tdx 库)
BIN := tdx-server

.PHONY: build run clean
build:                ## 编译: 产出 ./tdx-server
	cd web && go build -mod=mod -o ../$(BIN) .

run: build            ## 编译并启动 (端口用环境变量 TDX_PORT, 默认 8080)
	./$(BIN)

clean:
	rm -f $(BIN)
