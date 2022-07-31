# hello-aws-golang

AWS Lambda functions sample with Golang and two different deployment tools:
* AWS Serverless Application Model ([AWS SAM](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html))
* Serverless Framework ([SLS](https://www.serverless.com/blog/framework-example-golang-lambda-support))

### Requirements

* Ubuntu 20
* Golang 1.18
* AWS Toolkit for [Jetbrains](https://aws.amazon.com/intellij/) IDEs

### Project structure

| Resource        | Description                                                     |
|-----------------|-----------------------------------------------------------------|
| .aws-sam        | SAM deploy output/generated files                               |
| .serverless     | Serverless deploy output/generated files                        |
| bin             | Serverless binaries location                                    |
| cmd/hello       | **hello** function                                              |
| cmd/world       | **world** function                                              |
| CONTRIBUTING.md | Comparison project maintenance with Serverless and with AWS SAM |
| samconfig.toml  | AWS SAM config                                                  |
| serverless.yml  | Serverless lambda deployment config                             |
| setup.sh        | bash script to setup env on Ubuntu                              |
| template.yaml   | AWS SAM lambda deployment config                                |