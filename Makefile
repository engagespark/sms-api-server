.PHONY: build
build:
	go build

.PHONY: vendor
vendor:
	go mod tidy -compat=1.22
	go mod vendor

.PHONY: nix-update
nix-update:
	nix-channel --add https://nixos.org/channels/nixpkgs-unstable
	#nix-channel --add https://nixos.org/channels/nixos-24.11-small nixpkgs
	nix-channel --update nixpkgs
	#nix-shell -p npins --run "npins init"
	nix-shell -p npins --run "npins update"

.PHONY: nix-build
nix-build:
	nix-build
