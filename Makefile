.PHONY: build
build:
	go build

.PHONY: vendor
vendor:
	go mod tidy -compat=1.22
	go mod vendor
