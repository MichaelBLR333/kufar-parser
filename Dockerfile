FROM node:20-slim

# Устанавливаем системный Chromium и все необходимые для него библиотеки
RUN apt-get update && apt-get install -y \
    chromium \
    libnss3 \
    libatk-bridge2.0-0 \
    libdrm2 \
    libxkbcommon0 \
    libgbm1 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# Указываем Puppeteer'у путь к системному Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /app

COPY package.json ./
COPY script.js ./

# Устанавливаем зависимости (теперь с dotenv)
RUN npm install puppeteer node-fetch@2 dotenv

CMD ["node", "script.js"]
