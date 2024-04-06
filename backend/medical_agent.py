import os
from langchain.tools import BaseTool, tool
from langchain_core.prompts import PromptTemplate
from langchain.agents import create_react_agent
from dotenv import load_dotenv

load_dotenv()
GOOGLE_API_KEY = os.getenv("GOOGLE_API_KEY")


@tool(name="custom_tool", description="A custom tool example")
def custom_tool(args):
    # Implement your tool logic here
    return {"output": f"Processed input: {args.input}"}


template = '''Answer the following questions as best you can. You have access to the following tools:

{tools}

Use the following format:

Question: the input question you must answer
Thought: you should always think about what to do
Action: the action to take, should be one of [{tool_names}]
Action Input: the input to the action
Observation: the result of the action
... (this Thought/Action/Action Input/Observation can repeat N times)
Thought: I now know the final answer
Final Answer: the final answer to the original input question

Begin!

Question: {input}
Thought:{agent_scratchpad}'''

prompt = PromptTemplate.from_template(template)




# Assuming 'tools' is a list of your custom tools
tools = [custom_tool]

agent = create_react_agent(llm, tools, prompt)
