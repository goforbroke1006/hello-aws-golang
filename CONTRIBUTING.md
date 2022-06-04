# hello-aws-golang

## Serverless

#### How to get information about deployed functions

```shell
serverless info
```

#### How to deploy

```shell
serverless deploy --verbose
```

#### How to invoke lambda function

```shell
serverless invoke --function HellodFunction
serverless invoke --function WorldFunction
```

## SAM

### How to create new lambda function with SAM

```shell
sam init --runtime go1.x --name helloworld
```

### How to run lambda function on local machine with SAM

```shell
export LAMBDA_NAME=WorldFunction

sam build ${LAMBDA_NAME} --template ./template.yaml --build-dir ./.aws-sam/build
echo "{}" > ./.aws-sam/event.json
sam local invoke ${LAMBDA_NAME} --template ./.aws-sam/build/template.yaml --event ./.aws-sam/event.json
```

### How to run lambda function on local machine with SAM

```shell
echo "{}" > ./.aws-sam/event.json
sam invoke WorldFunction --template ./.aws-sam/build/template.yaml --event ./.aws-sam/event.json
```

### How to deploy

```shell
sam deploy --resolve-s3
```