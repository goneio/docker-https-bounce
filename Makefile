all: prepare build push

prepare:
	docker pull nginx:alpine

build:
	docker build --squash -t gone/https-bounce --no-cache .

push:
	docker push gone/https-bounce