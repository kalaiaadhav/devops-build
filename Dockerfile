FROM httpd:2.4-alpine
WORKDIR /app
COPY package*.json ./
RUN apt-get update && apt-get install -y npm
RUN apk add --no-cache git 
COPY /build/index.html /var/www/html/index.html
EXPOSE 80
CMD ["httpd", "-D", "index.html"]
