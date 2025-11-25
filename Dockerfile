FROM php:8.2-fpm

# Install extensions (opsional)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy source code
COPY . /var/www/html

# Install nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start PHP-FPM and Nginx
CMD service nginx start && php-fpm
