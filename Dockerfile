
FROM node:18-slim
WORKDIR /app
COPY package*.json ./
RUN apk add --no-cache npm git
COPY . .
EXPOSE 80
CMD ["npm", "start"]

