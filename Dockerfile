FROM python:3.9-slim

# Install system dependencies if needed
RUN apt-get update && apt-get install -y build-essential libpq-dev

# Upgrade pip and install dependencies
COPY requirements.txt /app/
WORKDIR /app
RUN python3 -m pip install --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt
