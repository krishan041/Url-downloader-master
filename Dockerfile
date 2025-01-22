FROM python:3.9-slim

# Install system-level dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libjpeg-dev \
    zlib1g-dev \
    libssl-dev \
    libffi-dev \
    git \
    && apt-get clean

# Set the working directory
WORKDIR /app

# Copy project files
COPY . .

# Upgrade pip
RUN pip install --upgrade pip

# Install dependencies
RUN pip install --upgrade --requirement requirements.txt

# Expose the port
EXPOSE 5000

# Run the application
CMD ["gunicorn", "app:app"]

docker build -t url-downloader.

docker run -p 5000:5000 url-downloader
