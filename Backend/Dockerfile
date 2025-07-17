FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Install wait-port to delay backend until PostgreSQL is ready
RUN npm install -g wait-port

EXPOSE 3016

CMD wait-port postgres:5432 && node server.js

