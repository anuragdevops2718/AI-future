FROM python:3.11-slim

WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app
COPY . .

# create data dir for sqlite
RUN mkdir -p /data

EXPOSE 5000
ENV PYTHONUNBUFFERED=1
ENV PORT=5000

CMD ["python", "app.py"]
