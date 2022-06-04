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

### How to run remote lambda function

```shell
aws lambda invoke --region us-east-1 \
  --function-name hello-aws-golang-dev-HelloFunction \
  --invocation-type RequestResponse \
  --payload "{}" \
  outlog.txt

aws lambda invoke --region us-east-1 \
  --function-name hello-aws-golang-dev-WorldFunction \
  --invocation-type RequestResponse \
  --payload "{}" \
  outlog.txt
  
```

### How to deploy

```shell
sam deploy --resolve-s3
```

### Usefull links

* [samconfig.toml sample](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-config.html)
