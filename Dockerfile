# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables to ensure Python output is not buffered
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies required for building and compiling Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*  # Clean up apt cache to reduce image size

# Copy the current directory contents into the container at /app
COPY . /app/

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install the Python dependencies from the requirements.txt file
RUN pip install --no-cache-dir --requirement requirements.txt

# Expose the port the app runs on (for web applications)
EXPOSE 5000

# Define the default command to run your application
# Replace 'app.py' with your main script if it's different (e.g., 'manage.py' for Django apps)
CMD ["python", "app.py"]
