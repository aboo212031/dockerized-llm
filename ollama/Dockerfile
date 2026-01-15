FROM nvidia/cuda:12.1.0-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install zstd -y

RUN curl -fsSL https://ollama.com/install.sh | sh

WORKDIR /app

COPY entrypoint.sh .

EXPOSE 11434

ENTRYPOINT ["./entrypoint.sh"]
