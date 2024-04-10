@echo off
REM 建立 Server 遠端監控連線
docker context create ai_server --docker "host=tcp://10.2.7.29:2375"

REM 使用 Server 遠端監控
docker context use ai_server

REM 建構 Docker 鏡像
docker build -f .\Ubuntu22.04-CUDA.Dockerfile -t ubuntu22.04-cuda:latest .

REM Run Docker Container
docker run --gpus all -d --name %1 -v %2:/workspace -it ubuntu22.04-cuda:latest

REM Enter docker bash
docker exec -it %1 bash