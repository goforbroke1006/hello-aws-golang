.PHONY: build clean deploy

SERVERLESS_BUILD_DIR=./bin

serverless/all: serverless/dep serverless/build serverless/deploy

serverless/dep:
	go mod download

serverless/build:
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o ${SERVERLESS_BUILD_DIR}/hello hello/main.go
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o ${SERVERLESS_BUILD_DIR}/world world/main.go

serverless/deploy:
	serverless deploy --verbose

sam/build:
	sam build --template ./template.yaml

sam/deploy:
	sam deploy --resolve-s3