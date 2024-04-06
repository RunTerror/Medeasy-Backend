from fastapi import FastAPI, UploadFile, File
from pydantic import BaseModel
from doctor_agent import Diagnoser

app = FastAPI()


class PatientDetails(BaseModel):
    age: int
    heartbeat_rate: int
    complaint: str
    metadata: str


@app.on_event("startup")



@app.post("/upload/")
async def upload_reports(file1: UploadFile = File(...), file2: UploadFile = File(...)):
    """

    :param file1:
    :param file2:
    :return:
    """

    file1_contents = await file1.read()
    file1_info = {
        "filename": file1.name,
        "content_type": file1.content_type,
        "size": len(file1_contents)
    }

    file2_contents = await file2.read()
    file2_info = {
        "filename": file2.filename,
        "content_type": file2.content_type,
        "size": len(file2_contents)
    }

    return {"file1": file1_info, "file2": file2_info}


@app.post("/initial_diagnose")
async def run_diagnosis(patient_info: PatientDetails):
    """
    Endpoint to accept patients' details and run a initial diagnosis
    :param patient_info:
    :return:
    """

def analyse_ECG(self):
    """
    Diagnose ECG data using custom trained model
    :param self:
    :return:
        tuple: A tuple containing the predicted results and the test duration.
    """
    model_path =
