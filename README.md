# MkDocker - A Docker image for MkDocs

This is a simple docker container for running MkDocs locally. 

The contents of the `serve` directory, which should contain `mkdocs.yml`, 
a `docs` directory, and any other needed site content, will be served by
MkDocs on the defined local TCP port.

The serve directory is continually monitored by MkDocs, any live (and
non-breaking) changes you make will be shown.

You should delete the contents of the serve directory and replace them with
your own.

## Running

To get the image into your docker system, either:

- pull the image from github: `docker pull mjlumley/mkdocker`
- load an image tar file: `docker load --input mkdocker.tar`

To run, an example using (host) port 8101, and serving up the ./serve directory:

`docker run -dp 8101:80 -w /app -v "$(pwd)/serve:/app" mjlumley/mkdocker`

The absolute easiest way though, is to download the docker-compose.yml file, place it in your base of your mkdocs source directory (ie alongside the mkdocs.yml), and edit the docker-compose file so that the volume looks like this:

```yaml
volumes:
  - ./:/app
```
Then run with `docker-compose up`.

##  Viewing

The container runs `mkdocs serve` and can be viewed on <http://localhost:8081>.

Default settings (for example local port), are defined in the `docker-compose.yml`
file, or adjusting the command line options when running docker by hand.

## Docker Image

This is a specialised image. Python requirements for mkdocs plugins and
extensions are defined in the `requirements.txt` file, and the image will need
to be rebuilt in an internet-connected environment.

The image contains git if you need to interact with a repository, however you
would be better using git on the host system within the serve directory bind.

## References

- [MkDocs](https://www.mkdocs.org/)
- Image on [DockerHub](https://hub.docker.com/repository/docker/mjlumley/mkdocker)
- Source on [GitHub](https://github.com/mjlumley/mkdocker)