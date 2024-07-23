# Stage 1: Build the Angular app
FROM node:18 AS build

WORKDIR /app

# Copy only the package.json and package-lock.json to the working directory
COPY payoneer/package*.json ./

# Install dependencies and Angular CLI
RUN npm install -g @angular/cli
# Install dependencies
RUN npm install

RUN npm i -D @types/cypress@latest
# Copy the rest of the Angular project
COPY payoneer/ ./

# Build the Angular application
RUN ng build --


EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
