
# Use an official lightweight Python image as base
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir fastapi uvicorn

# Expose the application port
EXPOSE 8000

# Define the startup command
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
