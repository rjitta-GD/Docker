# Use the official Node.js image as a base (use a newer version)
FROM node:20

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Install json-server globally
RUN npm install -g json-server

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the microservice
CMD ["json-server", "--watch", "db.json", "--host", "0.0.0.0"]