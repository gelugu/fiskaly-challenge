# Task 1: Docker — Hello World Web App

## Approach

Go was chosen for the application language (I like golang, favorite language for backend and data processing).
It compiles to a single static binary with no runtime dependencies, which allows a `FROM scratch` final image — no OS, no shell, no package manager.
The resulting image is ~7MB.

The Dockerfile uses a multi-stage build:
1. **Build stage** — compiles the Go binary for a fully static executable. And updating ca-certificates (necessary for http server since we are using `scratch` image).
2. **Runtime stage** — copies only the ca-certificates and binary into a `scratch` (empty) image.

This is the smallest possible container for a real HTTP server.

`.dockerignore` ensures we are not transferring files we don't need for the build.
Usually it's a security concern. But since it's a multistage build, the main reason is the docker caching (faster rebuild).

## Usage

```bash
docker build -t hello-world .
docker run -d -p 8080:8080 hello-world
curl http://localhost:8080

> Hello World
```

To make it accessible from other devices on the same network, the `-p 8080:8080` flag binds  to all interfaces by default.
Additionally, we can use `--network host`. Useful for local development.
