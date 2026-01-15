from fastapi import FastAPI, UploadFile
from faster_whisper import WhisperModel
import tempfile
import shutil

MODEL_DIR = "/models/whisper"

app = FastAPI()

model = WhisperModel(
    "medium.en",
    device="cuda",
    compute_type="float16",
    download_root=MODEL_DIR
)

@app.post("/transcribe")
async def transcribe(file: UploadFile):
    with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as tmp:
        shutil.copyfileobj(file.file, tmp)
        tmp_path = tmp.name

    segments, _ = model.transcribe(tmp_path, language="en")
    return {"text": " ".join(s.text.strip() for s in segments)}
