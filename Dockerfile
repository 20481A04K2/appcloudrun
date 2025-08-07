# Use official Python image as base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy application code
COPY . .

# Install Flask and Gunicorn directly
RUN pip install --no-cache-dir flask gunicorn

# Expose port for Cloud Run
EXPOSE 8080

# Run the app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
