from fastapi import FastAPI, UploadFile, File

app = FastAPI()


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
        "content_type":file2.content_type,
        "size": len(file2_contents)
    }

    return