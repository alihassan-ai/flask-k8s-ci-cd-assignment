# Multi-stage Dockerfile for Flask Application
# Stage 1: Builder
FROM python:3.11-slim as builder

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Stage 2: Runtime
FROM python:3.11-slim

WORKDIR /app

# Copy installed packages from builder
COPY --from=builder /root/.local /root/.local

# Copy application code
COPY app.py .
COPY utils.py .

# Make sure scripts in .local are usable
ENV PATH=/root/.local/bin:$PATH

# Expose port 5000
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
