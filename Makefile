.PHONY: build
build:
	go build -v -mod=vendor

.PHONY: vendor
vendor:
	go mod vendor
