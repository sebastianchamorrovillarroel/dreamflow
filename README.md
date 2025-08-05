# n8n en Render

Este proyecto despliega una instancia de [n8n](https://n8n.io) en Render.com utilizando Docker.

## Cómo funciona

- Render construye el contenedor desde el `Dockerfile`.
- Se protegen los accesos con usuario y contraseña (ver `render.yaml`).
- Puedes acceder a tu instancia n8n en: `https://tu-subdominio.onrender.com`

## Variables de entorno

- `N8N_BASIC_AUTH_USER`: Usuario para acceder
- `N8N_BASIC_AUTH_PASSWORD`: Contraseña
- `N8N_HOST`: Dominio de tu instancia
- `N8N_PROTOCOL`: Usa `https`

## Despliegue

1. Haz push de estos archivos a GitHub.
2. Entra a [Render.com](https://render.com) y crea un nuevo Web Service.
3. Selecciona tu repo y Render detectará automáticamente el `render.yaml`.
4. Espera unos minutos y listo.

## Licencia

MIT
