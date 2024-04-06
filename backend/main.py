from fastapi import FastAPI, UploadFile, File
from pydantic import BaseModel
from langchain_google_genai import ChatGoogleGenerativeAI
from doctor_agent import Diagnoser
import uvicorn

app = FastAPI()


class PatientDetails(BaseModel):
    age: int
    heartbeat_rate: int
    complaint: str
    metadata: str
    chat_history: dict


# @app.on_event("startup")
# @app.post("/upload/")
# async def upload_reports(file1: UploadFile = File(...), file2: UploadFile = File(...)):
#     """
#
#     :param file1:
#     :param file2:
#     :return:
#     """
#
#     file1_contents = await file1.read()
#     file1_info = {
#         "filename": file1.name,
#         "content_type": file1.content_type,
#         "size": len(file1_contents)
#     }
#
#     file2_contents = await file2.read()
#     file2_info = {
#         "filename": file2.filename,
#         "content_type": file2.content_type,
#         "size": len(file2_contents)
#     }
#
#     return {"file1": file1_info, "file2": file2_info}

@app.post("/initial_diagnose")
async def run_diagnosis(patient_info: PatientDetails):
    """
    Endpoint to accept patients' details and run a initial diagnosis and ask follow up questions
    :param patient_info:
    :return:
    """
    diagnoser = Diagnoser()
    follow_up_question = diagnoser.ask_validation_questions(symptoms=patient_info.complain,
                                                            chat_history=patient_info.chat_history)
    return {'follow_question': follow_up_question}

@app.post("/analyse_ecg")
def analyse_ECG(self):
    """
    Diagnose ECG data using custom trained model
    :param self:
    :return:
        tuple: A tuple containing the predicted results and the test duration.
    """



if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
