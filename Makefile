TRINO_VERSION=365
TRINO_QUERY_PORT=8080
TRINO_DISCOVERY_PORT=8000

docker-build-examplehttp:
	cd ExampleHttpConnector_image \
	&& docker build -t msteffenpachyderm/trino_examplehttp .

docker-run-examplehttp: docker-build
	docker run -p $(TRINO_QUERY_PORT):$(TRINO_QUERY_PORT) msteffenpachyderm/trino_examplehttp

trinocli:
	RUN curl -o ./trinocli -L https://repo1.maven.org/maven2/io/trino/trino-cli/$(TRINO_VERSION)/trino-cli-$(TRINO_VERSION)-executable.jar \
	  && chmod +x ./trinocli

.PHONY: \
	docker-build-examplehttp \
	docker-run-examplehttp
