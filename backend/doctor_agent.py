from typing import Optional
import os
from langchain.chains import LLMChain
from langchain.prompts import PromptTemplate
# from langchain_experimental.autonomous_agents import BabyAGI
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.agents import initialize_agent

from dotenv import load_dotenv


load_dotenv()
GOOGLE_API_KEY = os.getenv("GOOGLE_API_KEY")


class Diagnoser:
    def __init__(self):
        diagnose_prompt = """You are an expert medical expert. Your task it to convert the given hindi conversation into English. So that it becomes easier for the doctor to diagnose the disease.
        {patient_complain}
        """
        self.llm_template = PromptTemplate.from_template(diagnose_prompt)
        self.llm = ChatGoogleGenerativeAI(model="gemini-pro", google_api_key=GOOGLE_API_KEY)
        self.diganose_chain = LLMChain(llm=self.llm, prompt=self.llm_template, verbose=True)
        # self.chain = self.llm_template | self.llm

    def describe_symptoms(self, complaint):
        output = self.diganose_chain.run(patient_complain = complaint)
        return output

    def initial_diagnose(self, ):


if __name__ == "__main__":
    diagnoser = Diagnoser()
    complain = "Mujhe pet m bohot tez acidity ho rhi h aur saath m jee ghabra rha h"
    initial_diagnose = diagnoser.initial_diagnosing_questionaire(complain)
    print(initial_diagnose)



