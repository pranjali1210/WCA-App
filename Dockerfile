# Use the official Node.js base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the app's files to the container
COPY . .

# Build the React app
RUN npm run build

# Expose the port your React app is running on
EXPOSE 3000

# Command to start the React app
CMD ["npm", "start"]
