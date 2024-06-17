# Serveo Docker

This Docker image is designed to simplify the setup and use of the tunneling service provided by serveo.net in Docker environments. serveo.net allows you to expose local services to the internet without the need for configuring port forwarding or modifying firewalls.

## Getting Started

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Docker Compose

```yml
version: "3"

services:
  serveo:
    image: ghcr.io/roxcom/serveo:latest
    container_name: serveo
    restart: always
    volumes:
      - /opt/serveo/.ssh:/root/.ssh/
    environment:
      - LOCAL_HOST=localhost
      - LOCAL_PORT=3000
      - SERVEO_DOMAIN=mydom
      - SERVEO_PORT=80
      - STRICT_CHECKING=true
    networks:
      - net
networks:
  net:
    external: true
```

#### Environment Variables

* `LOCAL_HOST` - The host of local service
* `LOCAL_PORT` - The port of local service
* `SERVEO_DOMAIN` - The domain of remote service (optional)
* `SERVEO_PORT` - The port of remote service (optional)
* `SSH_PORT` - The port of SSH service (optional)
* `STRICT_CHECKING` - The port of remote service (optional)

#### Volumes

* `/root/.ssh/id_rsa` - The SSH keyring for connection

#### Useful File Locations

* `/opt/serveo/serveo.sh` - serveo.sh script

## Built With

* OpenSSH
* Serveo.net

## Find Us

* [GitHub](https://github.com/roxcom-br/serveo-docker)
* [Ghcr.io](https://ghcr.io/roxcom/serveo:latest)

## Authors

* **Roxxedo** - *Initial work* - [Github](https://github.com/roxxedo)

See also the list of [contributors](https://github.com/your/repository/contributors) who 
participated in this project.

## License

This project is licensed under the GNU General Public License v3 - see the [LICENSE.md](LICENSE.md) file for details.