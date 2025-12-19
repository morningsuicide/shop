FROM nginx:alpine

# Копирование конфигурации
COPY frontend.conf /etc/nginx/conf.d/frontend.conf
COPY backend.conf /etc/nginx/conf.d/backend.conf

# Удаление дефолтного конфига
RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

