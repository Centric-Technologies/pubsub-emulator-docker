# GCP Pub\Sub Emulator in Docker
This repository is for easy hosting of the GCP Pub\Sub emulator inside a docker container

# Usage
## docker-compose
To run the container inside a docker compose, see the following example:
```
version: "3"

services:
  pubsub-emulator:
    image: centric/pubsub-emulator:latest
    environment:
      - PROJECT_ID=project-test
      - PORT=8085
    ports:
      - "8085:8085"

  some-service:
    build: .
    environment:
      - PUBSUB_EMULATOR_HOST=0.0.0.0:8085
    depends_on:
      - pubsub-emulator
```

## docker run
Use the following command to run the container with `docker run`
`docker run -e PROJECT_ID=project-test -e PORT=8085 -p 8085:8085 centric/pubsub-emulator:latest`

# Building
`docker build centric/pubsub-emulator:latest .`