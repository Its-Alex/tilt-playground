# tilt-playground

This playgroound is aimed to test [tilt](https://github.com/tilt-dev/tilt).

## Prerequisites

- [Docker](https://www.docker.com/)
- [mise](https://mise.jdx.dev/)

When above dependencies are installed, you can run:

```bash
$ mise trust && mise install
```

This will trust the mise configuration and install the dependencies with
corresponding versions.

## Getting started

```bash
$ ./scripts/kind-up.sh
```

This will create a local kind cluster. You can see the cluster using `kubectl`:

```bash
$ kubectl get nodes
```

Then you can build an hello-world docker image:

```bash
$ ./services/hello-world/scripts/docker-build.sh
```

And upload the docker image to the kind cluster:

```bash
$ ./services/hello-world/scripts/upload-docker-image-to-kind.sh
```

Finally, you can deploy the app in the kind cluster:

```bash
$ ./tanka/scripts/install-vendors.sh && ./tanka/scripts/tk-apply.sh
```

Those tasks can be done with the `./scripts/up.sh` script.

## License

[MIT](LICENSE)
