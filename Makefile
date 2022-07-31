.PHONY: build clean deploy

SRC_DIR=./cmd
BUILD_DIR=./bin

sls/all: dep sls/build sls/deploy
sam/all: dep sam/build sam/deploy

dep:
	go mod download

sls/build:
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o ${BUILD_DIR}/hello ${SRC_DIR}/hello/main.go
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o ${BUILD_DIR}/world ${SRC_DIR}/world/main.go

sls/deploy:
	serverless deploy --verbose

sls/undeploy:
	serverless remove

sam/build:
	sam build --template ./template.yaml

sam/deploy:
	sam deploy --resolve-s3

sam/undeploy:
	sam delete