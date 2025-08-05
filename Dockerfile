FROM node:18-slim

# Instala dependencias básicas
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    wget \
    curl \
    gnupg \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Variables para Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Crea directorio app
WORKDIR /app

# Copia archivos
COPY package*.json ./
RUN npm install

COPY . .

# Expone el puerto estándar de n8n
EXPOSE 5678

# Lanza n8n al iniciar el contenedor
CMD ["npx", "n8n"]
