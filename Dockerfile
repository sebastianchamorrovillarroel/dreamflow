FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache chromium nodejs npm
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

USER node
RUN npm install puppeteer@latest

EXPOSE 5678

# Usar sh para encontrar y ejecutar n8n automáticamente
CMD ["sh", "-c", "$(which n8n || find / -name n8n -type f 2>/dev/null | head -1) start"]
USER node

# Instalar Puppeteer
RUN npm install puppeteer@latest

EXPOSE 5678

# Usar el comando original del contenedor base (sin ruta específica)
CMD ["n8n"]
