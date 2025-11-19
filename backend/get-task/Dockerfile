FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        unixodbc \
        unixodbc-dev && \
    rm -rf /var/lib/apt/lists/*
    
# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app
COPY . .

EXPOSE 5000
ENV PYTHONUNBUFFERED=1
ENV PORT=5000

CMD ["python", "app.py"]
