# Play Framework

This image contains Play 1.5 and use the Oracle JDK 8 as base image.

To start the server use:

```
docker run --name play1-example -p 9000:9000 -d osmanirosado/play-framework
```

The server is started in develop mode, see the logs using:

```
docker logs play1-example
```
