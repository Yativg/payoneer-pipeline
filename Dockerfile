# Stage 1: Build the Angular app
FROM node:18 AS build

WORKDIR /payoneer

# Install dependencies and Angular CLI
RUN npm install -g @angular/cli

# Copy package.json and package-lock.json
COPY package.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN ng build

# Stage 2: Serve the Angular app
FROM nginx:alpine

# Copy the built Angular app from the previous stage
COPY --from=build /app/dist/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
