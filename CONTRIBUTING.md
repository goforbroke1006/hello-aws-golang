# hello-aws-golang

## Serverless

#### How to get information about deployed functions

```shell
sls info
```

#### How to deploy

```shell
sls deploy --verbose
```

#### How to invoke lambda function with SLS

```shell
sls invoke --function HelloFunction
sls invoke --function WorldFunction
```

## SAM

### How to create new lambda function with SAM

```shell
sam init --runtime go1.x --name helloworld
```

### How to invoke lambda function on local machine with SAM

Same things you can run from **template.yaml** in IDE if **AWS Toolkit** plugin installed.

```shell
export LAMBDA_NAME=WorldFunction

sam build ${LAMBDA_NAME} --template ./template.yaml --build-dir ./.aws-sam/build
echo "{}" > /tmp/${LAMBDA_NAME}-event.json
sam local invoke ${LAMBDA_NAME} \
  --template ./.aws-sam/build/template.yaml \
  --event    /tmp/${LAMBDA_NAME}-event.json
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

## AWS CLI samples

```shell
aws lambda list-functions --region=us-east-1
aws lambda list-functions --region=us-west-2
aws lambda get-function --region=us-east-1 --function-name hello-aws-golang-dev-HelloFunction

```

### Usefull links

* [samconfig.toml sample](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-config.html)
