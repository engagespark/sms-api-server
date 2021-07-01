.PHONY: build
build:
	go build -mod=vendor

.PHONY: vendor
vendor:
	go mod vendor
