.PHONY: help up down restart build logs shell-fpm shell-cli composer migrate install init

help:
	@echo "Available commands:"
	@echo "  make up          - Start containers"
	@echo "  make down        - Stop containers"
	@echo "  make restart     - Restart containers"
	@echo "  make build       - Build and start containers"
	@echo "  make logs        - Show logs"
	@echo "  make shell-fpm   - Enter PHP-FPM container"
	@echo "  make shell-cli   - Enter PHP-CLI container"
	@echo "  make composer    - Run composer command"
	@echo "  make migrate     - Run migrations"
	@echo "  make install     - Install Yii2 advanced"
	@echo "  make init        - Initialize Yii2 environments"

up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

build:
	docker-compose up -d --build

logs:
	docker-compose logs -f

shell-fpm:
	docker-compose exec php-fpm bash

shell-cli:
	docker-compose exec php-cli bash

composer:
	docker-compose exec php-cli composer $(filter-out $@,$(MAKECMDGOALS))

migrate:
	docker-compose exec php-cli php yii migrate

migrate-create:
	docker-compose exec php-cli php yii migrate/create $(filter-out $@,$(MAKECMDGOALS))

install:
	docker-compose exec php-cli composer create-project --prefer-dist yiisoft/yii2-app-advanced .

init:
	docker-compose exec php-cli php init --env=Development --overwrite=All

rbac-init:
	docker-compose exec php-cli php yii rbac/init

cache-flush:
	docker-compose exec php-cli php yii cache/flush-all

postgres:
	docker-compose exec postgres psql -U shop_user -d shop

%:
	@:

