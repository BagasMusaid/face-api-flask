FROM python:3.10

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    libgtk-3-dev \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Salin semua file ke container
COPY . .

# Install Python dependencies
RUN python -m venv venv
RUN ./venv/bin/pip install --upgrade pip
RUN ./venv/bin/pip install -r requirements.txt

# Jalankan aplikasi dengan Gunicorn (misalnya app.py dengan Flask)
CMD ["./venv/bin/gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
