#FROM node:12.22.0-buster
FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  chromium \
  libatk-bridge2.0-0 \
  libxkbcommon0 \
  libwayland-client0 \
  libgtk-3-0 && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install
RUN npm install --save puppeteer
RUN npm install cors

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
