TRINO_QUERY_PORT=8080
TRINO_DISCOVERY_PORT=8000

docker-build:
	docker build -t trino .

docker-run: docker-build
	@echo starting Trino docker container. ^C will kill it, but it takes 10-15s to stop
	docker run -p $(TRINO_QUERY_PORT):$(TRINO_QUERY_PORT) trino trino-launcher run

.PHONY: \
	docker-build \
	docker-run
