import tempfile
import os
import shutil
from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware  # Import CORSMiddleware
from pydantic import BaseModel
from model.sample_prediction import ECG
from backend.doctor_agent import Diagnoser
import uvicorn
from dotenv import load_dotenv

app = FastAPI()
ecg_model = ECG()

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins, you can specify specific domains instead of "*"
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"],  # Specify allowed HTTP methods
    allow_headers=["*"],  # Allow all headers
)

class PatientDetails(BaseModel):
    age: int
    heartbeat_rate: int
    complaint: str
    metadata: str
    chat_history: dict

class PatientSession(BaseModel):
    symptoms: str
    chat_history: dict


@app.post("/upload_records/ecg")
async def upload_files(ecg_lr: UploadFile = File(...), ecg_hr: UploadFile = File(...)):
    try:
        temp_dir = "model/tmp_data/"
        os.makedirs(temp_dir, exist_ok=True)
        ecg_lr_path = temp_dir + ecg_lr.filename
        ecg_hr_path = temp_dir + ecg_hr.filename

        with open(ecg_lr_path, "wb") as lr, open(ecg_hr_path, "wb") as hr:
            lr_co = ecg_lr.file.read()
            hr_co = ecg_hr.file.read()
            lr.write(lr_co)
            hr.write(hr_co)
        file_path = ecg_lr.filename[:-4]
        prediction = ecg_model.predict(file_path, temp_dir)
        return {"messages": "Files uploaded successfully", "prediction": prediction}

    except Exception as e:
        return {'message': str(e)}

@app.post("/initial_diagnose")
async def run_diagnosis(patient_info: PatientDetails):
    diagnoser = Diagnoser()
    follow_up_question = diagnoser.ask_validation_questions(symptoms=patient_info.complaint,
                                                            chat_history=patient_info.chat_history)
    return {'follow_question': follow_up_question}

@app.post("/get_feedback")
async def suggested_reports(patient_session: PatientSession):
    diagnoser = Diagnoser()
    required_reports = diagnoser.ask_required_reports(patient_session.symptoms, patient_session.chat_history)
    return {'suggested_reports': required_reports}


if __name__ == "__main__":
    uvicorn.run(app, port=8000)
