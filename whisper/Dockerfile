FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y \
    python3 python3-pip ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip3 install --no-cache-dir \
    fastapi uvicorn python-multipart faster-whisper

COPY whisper_server.py .
COPY entrypoint.sh .

EXPOSE 8001

ENTRYPOINT ["./entrypoint.sh"]
