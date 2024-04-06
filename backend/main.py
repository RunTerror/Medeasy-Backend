from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware  # Import CORSMiddleware
from pydantic import BaseModel
from langchain_google_genai import ChatGoogleGenerativeAI
from doctor_agent import Diagnoser
import uvicorn

app = FastAPI()

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

@app.post("/initial_diagnose")
async def run_diagnosis(patient_info: PatientDetails):
    diagnoser = Diagnoser()
    follow_up_question = diagnoser.ask_validation_questions(symptoms=patient_info.complaint,
                                                            chat_history=patient_info.chat_history)
    return {'follow_question': follow_up_question}

if __name__ == "__main__":
    uvicorn.run(app, port=8000)
