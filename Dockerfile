FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y python3-venv
RUN python -m venv /app/venv
RUN /app/venv/bin/pip install --upgrade pip
RUN /app/venv/bin/pip install -r requirements.txt