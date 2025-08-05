FROM n8nio/n8n:latest

USER root

# Instalar todas las dependencias necesarias (incluyendo nodejs y npm)
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# Variables de entorno para Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

USER node

# Instalar Puppeteer
RUN npm install puppeteer@latest

EXPOSE 5678

# Usar la ruta completa del comando n8n
CMD ["/usr/local/bin/n8n", "start"]
