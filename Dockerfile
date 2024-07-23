# Stage 1: Build the Angular app
FROM node:18 AS build

WORKDIR /app

COPY payoneer/package*.json ./

RUN npm install -g @angular/cli
RUN npm install

RUN npm i -D @types/cypress@latest

COPY payoneer/ ./

CMD ["ng", "serve", "--host", "0.0.0.0"]

