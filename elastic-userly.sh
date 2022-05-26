#!/bin/sh
if [ ! -f .env ]
then
  export $(cat .env | xargs)
fi

curl --location --request PUT $es_url'/_template/uzerly' \
--header 'Content-Type: application/json' \
--data-raw '{
    "index_patterns": ["*-sync-*"],

    "settings": {
      "index": {
        "max_result_window": "100000",
        "refresh_interval": "30s",
        "number_of_shards": "1",
        "number_of_replicas": "0"
      }
    },
    "mappings": {
      "properties": {
        "uuid": {
          "type": "text",
          "analyzer": "keyword"
        },
        "uuid_key": {
          "type": "text",
          "fielddata": true
        }
      }
      }
}'