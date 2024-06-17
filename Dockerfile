MAINTAINER Roxcom <roxcom.contact@gmail.com>

LABEL version="1.0"
LABEL description="A Docker image for Serveo.net"

FROM alpine:latest
RUN apk add --update --no-cache openssh
WORKDIR /opt/serveo

COPY serveo.sh /opt/serveo

CMD eval $(ssh-agent -s) && /opt/serveo/serveo.sh

