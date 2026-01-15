#!/bin/bash
set -e

MODEL_DIR=/models/whisper
MODEL_NAME=medium.en

mkdir -p ${MODEL_DIR}

python3 - <<EOF
from faster_whisper import WhisperModel
print("Checking Whisper model...")
WhisperModel(
    "${MODEL_NAME}",
    device="cuda",
    compute_type="float16",
    download_root="${MODEL_DIR}"
)
print("Whisper model ready.")
EOF

exec uvicorn whisper_server:app --host 0.0.0.0 --port 8001
