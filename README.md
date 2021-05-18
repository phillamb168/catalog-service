# Overview

This repo has the code for the catalog service for demonstrations.  See the [overview](https://github.com/dt-orders/overview) repo for an overview for that whole application.

## Pre-requisites

The following programs to be installed
* Java 1.8
* Maven
* Docker

## Build and Run Locally

1. run these commands
  ```
  ./mvnw clean package
  java -jar target/*.jar
  ```
2. access application at ```http://localhost:8080```

## quicktest

Use the provided Unix shell script that loops and calls the app URL.  Just call:

```./quicktest.sh <catalog base url>```

For example:

```./quicktest.sh http://localhost:8080```

## Build Docker Images and push images to a repository

Use the provided Unix shell script that will build the docker image and publish it. There are different versions that will be built.  See the [overview](https://github.com/dt-orders/overview) repo for details on the problem patterns.

    Just call: `./buildpush.sh <REPOSITORY>`

    For example: `./buildpush.sh dtdemos`
    
## Build Docker images and run locally 

Use the provided Unix shell script that will build the docker image and run it. 

    Just call: `./buildrun.sh <REPOSITORY> <VERSION_TAG>`

    For example: `./buildrun.sh dtdemos 1`

2. access application at ```http://localhost:8080```

# Credits

* Original demo code: https://github.com/ewolff/microservice-kubernetes