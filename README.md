# @smarttj/core

Ядро и общая библиотека экосистемы **SmartTJ**. Содержит единую схему базы данных Prisma, контракты и типы для AI-сервисов, а также константы очередей задач.

---

## 📦 Установка

```bash
npm install @smarttj/core
# или
pnpm add @smarttj/core
# или
yarn add @smarttj/core
# или
bun add @smarttj/core
```

---

## 🚀 Основные модули и импорты

Пакет поддерживает модульные суб-экспорты:

### 1. Очереди сообщений (`@smarttj/core/queue` или `@smarttj/core`)

Константы названий очередей для BullMQ / Redis:

```typescript
import { QUEUE_KEYS } from "@smarttj/core/queue";

// Доступные ключи очередей:
// QUEUE_KEYS.NOTIFICATION          -> "notification"
// QUEUE_KEYS.NOTIFICATION_TELEGRAM -> "notification-telegram"
// QUEUE_KEYS.PRODUCT_MODERATION    -> "product-moderation"
```

### 2. AI Контракты и Типы (`@smarttj/core/ai` или `@smarttj/core`)

Типы данных и энумы для взаимодействия с AI-модулями:

```typescript
import {
  AskRequest,
  AskResponse,
  AskRequestPurpose,
  AskRequestProvider,
} from "@smarttj/core/ai";

const request: AskRequest = {
  purpose: AskRequestPurpose.SUPPORT, // SUPPORT | ANALYTICS | PRODUCT_MODERATE
  provider: AskRequestProvider.OPENAI, // OPENAI | GEMINI | GROQ
  prompt: "Привет! Помоги решить вопрос с заказом.",
  context: "Контекст диалога...",
  temperature: 0.7,
};
```

### 3. Prisma Schema (`@smarttj/core/prisma/schema.prisma`)

Единая база данных PostgreSQL для всех сервисов экосистемы (пользователи, сессии, каталог товаров, заказы, корзина, платежи, чаты поддержки, отзывы и др.).

Использование схемы в зависимых сервисах:

```prisma
// В schema.prisma сервиса или через импорт/копирование:
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}
```

---

## 🛠 Разработка и команды

```bash
# Очистить и собрать проект (TypeScript -> dist)
npm run build

# Создать новую миграцию Prisma (требуется DATABASE_URL в .env)
npm run prisma:migrate
```

---

## 🚢 Публикация нового релиза в NPM

Публикация автоматизирована через **GitHub Actions** при пуше тегов `v*`:

```bash
# 1. Зафиксировать изменения
git add .
git commit -m "feat: description of changes"

# 2. Поднять версию (создаст коммит и git tag vX.X.X)
npm version patch   # или minor / major / 1.2.4 (major.minor.patch)

# 3. Отправить в GitHub с тегами для триггера publish.yml
git push --follow-tags
```
