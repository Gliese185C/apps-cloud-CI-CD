FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .

ENV PORT 8080

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:${PORT}", "app:app"]
