#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
# Copyright 2015 the original author or authors.

# Enable verbose script for init-based systems (можно отключить при необходимости)
# set -x

# Default scheduler values
DEFAULT_SCHED="cfq"
DEFAULT_SCHED_MQ="none"
DEFAULT_SCHED_BFQ="bfq"
DEFAULT_SCHED_BFQ_MQ="none"
DEFAULT_SCHED_TYPE="bfq"

# Инициализация переменных приложения
APP_MQ_TYPE="none"
APP_MQ_SCHED="none"
APP_SCHED="none"
APP_SCHED_TYPE="none"

# Уровень MQ: может быть low, medium, high или 0 (отключено)
APP_MQ="medium"

case "$APP_MQ" in
  "0")
    echo "MQ отключен"
    ;;
  "low")
    echo "Используется низкий уровень MQ"
    ;;
  "medium")
    echo "Используется средний уровень MQ"
    ;;
  "high")
    echo "Используется высокий уровень MQ"
    ;;
  *)
    echo "Неизвестное значение MQ: $APP_MQ"
    ;;
esac

# Пример использования типа планировщика
echo "Тип планировщика: $DEFAULT_SCHED_TYPE"
