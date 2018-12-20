# Docker Helm
This is a minimal Helm Docker image.
The idea of this container is to have the base of a deployment.
The new container apends the helm functionality about the following:
 - python 2 (needed for google cloud sdk)
 - google cloud sdk
 - helmfile
 - kubectl

### Docker Build
```
docker build -t dirkjkb/docker-helm-deploy .
```
### Docker Run
```
docker run dirkjkb/docker-helm-deploy
```