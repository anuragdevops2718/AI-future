FROM python:3.11-slim

WORKDIR /app

# ✅ Install ODBC + SQL Server driver (no secrets here)
RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg unixodbc-dev && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    rm -rf /var/lib/apt/lists/*

# Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# App code
COPY . .

EXPOSE 5000
ENV PYTHONUNBUFFERED=1
ENV PORT=5000

CMD ["python", "app.py"]
