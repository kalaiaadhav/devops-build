FROM httpd:2.4-alpine
WORKDIR /app
RUN apk add --no-cache git 
COPY index.html /var/www/html
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
