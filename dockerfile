# Use google cloud sdk
FROM google/cloud-sdk:alpine

ENV PORT 8085
ENV PROJECT_ID dev-project

# Pub/Sub emulator requires Java 7+
RUN apk --update add openjdk8-jre
RUN gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pub/Sub data
VOLUME /opt/data

COPY start .

EXPOSE ${PORT}

ENTRYPOINT ["./start"]