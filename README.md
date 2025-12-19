# Shop - Yii2 Advanced Application with Docker

Магазин на Yii2 Advanced Template с использованием Docker, PostgreSQL, Redis и Xdebug.

## 🛠 Технологии

- **PHP 8.2** (FPM + CLI)
- **Yii2 Advanced Template**
- **PostgreSQL 15**
- **Redis 7**
- **Nginx**
- **Xdebug 3**

## 📦 Структура Docker

- `php-fpm` - PHP-FPM контейнер с Xdebug для обработки веб-запросов
- `php-cli` - PHP-CLI контейнер с Xdebug для консольных команд и миграций
- `nginx` - Веб-сервер (Frontend на :8080, Backend на :8081)
- `postgres` - База данных PostgreSQL
- `redis` - Кэш и очереди

## 🚀 Быстрый старт

### 1. Клонирование и настройка окружения

```bash
# Скопируйте .env.example в .env
cp .env.example .env

# При необходимости отредактируйте .env
nano .env
```

### 2. Сборка и запуск контейнеров

```bash
# Сборка и запуск всех контейнеров
make build

# Или используйте docker-compose напрямую
docker-compose up -d --build
```

### 3. Установка Yii2 Advanced Template

```bash
# Установка Yii2 через Composer
make install

# Инициализация окружения (Development)
make init
```

### 4. Настройка базы данных

Отредактируйте конфигурацию БД в файлах:
- `common/config/main-local.php`

Пример конфигурации для PostgreSQL:

```php
'db' => [
    'class' => 'yii\db\Connection',
    'dsn' => 'pgsql:host=postgres;port=5432;dbname=shop',
    'username' => 'shop_user',
    'password' => 'shop_password',
    'charset' => 'utf8',
],
```

### 5. Запуск миграций

```bash
# Выполнить миграции
make migrate

# Создать новую миграцию
make migrate-create create_products_table
```

### 6. Доступ к приложению

- **Frontend**: http://localhost:8080
- **Backend**: http://localhost:8081

## 📝 Полезные команды

### Управление контейнерами

```bash
make up          # Запустить контейнеры
make down        # Остановить контейнеры
make restart     # Перезапустить контейнеры
make build       # Пересобрать и запустить
make logs        # Просмотр логов
```

### Работа с PHP

```bash
make shell-fpm   # Войти в PHP-FPM контейнер
make shell-cli   # Войти в PHP-CLI контейнер
```

### Composer

```bash
make composer install              # Установить зависимости
make composer require package/name # Установить пакет
make composer update               # Обновить зависимости
```

### Миграции и консольные команды

```bash
make migrate                       # Выполнить миграции
make migrate-create migration_name # Создать миграцию
make cache-flush                   # Очистить кэш
make rbac-init                     # Инициализировать RBAC
```

### База данных

```bash
make postgres    # Подключиться к PostgreSQL CLI
```

Или напрямую:
```bash
docker-compose exec postgres psql -U shop_user -d shop
```

## 🐛 Настройка Xdebug в PHPStorm

### 1. Настройка серверов

**Settings → PHP → Servers**

Создайте сервер:
- Name: `Docker`
- Host: `localhost`
- Port: `8080` (для frontend) или `8081` (для backend)
- Debugger: `Xdebug`
- Use path mappings: **✓**
  - `/home/dv1021/shop` → `/var/www/html`

### 2. Настройка Debug

**Settings → PHP → Debug**
- Xdebug port: `9003`
- Can accept external connections: **✓**

### 3. Включение/выключение Xdebug

Для PHP-FPM (по умолчанию включен):
```bash
# В .env измените
XDEBUG_MODE=debug  # включен
XDEBUG_MODE=off    # выключен
```

Для PHP-CLI (по умолчанию выключен):
```bash
# Временно включить в команде
docker-compose exec -e XDEBUG_MODE=debug php-cli php yii migrate
```

## 📂 Структура проекта Yii2

```
shop/
├── backend/          # Административная панель
├── frontend/         # Клиентская часть
├── console/          # Консольные команды и миграции
├── common/           # Общие компоненты
├── docker/           # Docker конфигурация
└── environments/     # Настройки окружений
```

## 🔐 Git и SSH

Для добавления проекта в GitHub используйте личный SSH ключ:

```bash
# Добавить remote
git remote add origin github-personal:YOUR_USERNAME/shop.git

# Отправить код
git push -u origin main
```

## 📄 Лицензия

MIT

