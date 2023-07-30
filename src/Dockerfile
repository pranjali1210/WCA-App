# Use the official Node.js image as the base image
FROM node:14 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire app directory to the container
COPY . .

# Build the React app
RUN npm run build

# Use a lightweight web server to serve the app
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
