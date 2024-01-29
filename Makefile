.PHONY: build
build:
	go build

.PHONY: vendor
vendor:
	go mod tidy -compat=1.21
	go mod vendor
