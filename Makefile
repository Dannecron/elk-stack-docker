compose-up-build:
	docker-compose up --build -d

compose-up:
	docker-compose up -d

compose-down:
	docker-compose down

curator-clean:
	docker run --rm \
		-v `pwd`/curator/curator.yml:/curator/curator.yml \
		-v `pwd`/curator/actions.yml:/curator/actions.yml \
		-e "ES_HOST=elasticsearch" \
		-e "ES_PORT=9200" \
		--network=elk_default \
		bitnami/elasticsearch-curator:5.8.1 --config=/curator/curator.yml /curator/actions.yml
