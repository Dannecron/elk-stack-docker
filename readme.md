# docker-compose for elk-stack

## Installation

1. Клонировать репозиторий
1. Копировать файл `docker-compose.override.examle.yml` в `docker-compose.override.yml`
1. Выполнить команду `docker-compose up --build -d` либо `make compose-up`
1. Kibana будет доступна по адресу `localhost:5601`

## Additional configuration

### Filebeat

Для чтения всех логов docker-контейнеров через `filebeat` необходимо сделать следующее:

1. В `.env` в переменную окружения `COMPOSE_PROFILES` через запятую добавить новый пункт `filebeat`
2. Поднять контейнер с `filebeat`, выполнив команду `docker-compose up -d filebeat`

### Elasticsearch

Хранение данных `elasticsearch` на локальной машине (добавлено в  `docker-compose.override.example.yml` по умолчанию)

* В `volumes` сервиса `elasticsearch` добавить новый раздел, где локальная папка (или `volume`) будет ссылаться на `/usr/share/elasticsearch/data`
* Например
  ```yml
  elasticsearch:
    volumes:
      - /home/user/elastic_data:/usr/share/elasticsearch/data
  ```
