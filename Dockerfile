# Use a lightweight Alpine image
FROM alpine:3.14

# Set the working directory in the container
WORKDIR /app

COPY package*.json ./

# Install Node.js and npm
RUN apk add --no-cache nodejs npm


# Copy package.json and package-lock.json to the container
# COPY ./package.json ./package-lock.json /app/


# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port the app runs on
EXPOSE 80

# Start the application
CMD ["npm", "start"]
