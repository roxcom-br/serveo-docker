FROM alpine:latest

LABEL maintainer="Roxcom <roxcom.contact@gmail.com>"
LABEL version="1.0"
LABEL description="A Docker image for Serveo.net"

RUN apk add --update --no-cache openssh
WORKDIR /opt/serveo

COPY serveo.sh /opt/serveo

CMD eval $(ssh-agent -s) && /opt/serveo/serveo.sh

