.PHONY: build
build:
	go build

.PHONY: vendor
vendor:
	go mod tidy -compat=1.24
	go mod vendor

.PHONY: nix-update
nix-update:
	./shell.sh --run "npins update"

.PHONY: nix-build
nix-build:
	./shell.sh --run "nix-build"
