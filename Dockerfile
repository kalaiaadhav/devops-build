FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Install npm and git using apk
RUN apk add --no-cache npm git

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
#RUN npm install

# Copy the rest of your application code
COPY . .

# Expose the port the app runs on
EXPOSE 80

# Start the application
CMD ["npm", "start"]
