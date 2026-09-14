FROM node:20-slim

# Устанавливаем зависимости для Chromium
RUN apt-get update && apt-get install -y \
    chromium \
    libnss3 \
    libatk-bridge2.0-0 \
    libdrm2 \
    libxkbcommon0 \
    libgbm1 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json ./
COPY script.js ./

RUN npm install puppeteer node-fetch@2

CMD ["node", "script.js"]
