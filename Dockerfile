FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .

# Força a atualização das ferramentas base vulneráveis detetadas pelo Trivy
RUN pip install --no-cache-dir --upgrade pip setuptools wheel jaraco.context

RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .

EXPOSE 8080
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
