FROM python:3.9-slim

WORKDIR app/

COPY app/requirements.txt  .

RUN apt-get update && apt-get install -y git && \
    pip install --no-cache-dir -r requirements.txt
    
COPY app/ ./

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]