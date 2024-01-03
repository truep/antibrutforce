app_name = anti-brutforce
src_path = ./cmd/main.go
bin_path = ./bin/
build_flags = -ldflags "-s -w" 

build:
	go mod tidy
	go build $(build_flags) -o $(bin_path)$(app_name) $(src_path)

.PHONY: clean

test: 
	go test -race -count 100

docker-build:
	docker compose up -d --build
	
clean:
	rm -rf $(bin_path)

all: test build