TRINO_VERSION=365
TRINO_QUERY_PORT=8080
TRINO_DISCOVERY_PORT=8000

EXAMPLEHTTP_IMAGE=msteffenpachyderm/trino_examplehttp

docker-build-examplehttp:
	cd ExampleHttpConnector_image \
	&& docker build -t $(EXAMPLEHTTP_IMAGE) .

examplehttp-demo: docker-build-examplehttp
	pachctl create repo data
	pachctl put file data@master -rf ExampleHttpConnector_image/data
	docker run -p $(TRINO_QUERY_PORT):$(TRINO_QUERY_PORT) $(EXAMPLEHTTP_IMAGE)

trinocli:
	RUN curl -o ./trinocli -L https://repo1.maven.org/maven2/io/trino/trino-cli/$(TRINO_VERSION)/trino-cli-$(TRINO_VERSION)-executable.jar \
	  && chmod +x ./trinocli

.PHONY: \
	docker-build-examplehttp \
	docker-run-examplehttp
