#!/bin/bash
set -e

export OLLAMA_HOST=0.0.0.0:11434
export OLLAMA_MODELS=/models/ollama
MODEL=gemma3:4b

mkdir -p ${OLLAMA_MODELS}

ollama serve &
sleep 5

if ! ollama list | grep -q "$MODEL"; then
  echo "Pulling Ollama model: $MODEL"
  ollama pull $MODEL
else
  echo "Ollama model already exists"
fi

wait
