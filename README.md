<!-- omit in toc -->
# tilt-playground

This playgroound is aimed to test [tilt](https://github.com/tilt-dev/tilt).

- [Prerequisites](#prerequisites)
- [Getting started](#getting-started)
- [Local registry](#local-registry)
- [Hack it](#hack-it)
- [Stop and cleanup](#stop-and-cleanup)
- [Notes on Tilt](#notes-on-tilt)
- [License](#license)

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

First you must start the kube clutser, for that we use [kind](https://kind.sigs.k8s.io/):

```bash
$ ./scripts/kind-up.sh
```

Then you can start the tilt server with:

```bash
$ tilt up
```

Then, in another terminal, check if everything is running:

```bash
$ curl http://localhost:8080/
Hello, World!
```

You can now try and edit any file in the `services/hello-world` or
`tanka` directories, [tilt](https://github.com/tilt-dev/tilt) will automatically
detect the changes and apply them to the kind cluster.

## Local registry

To use a local registry, you can run:

```bash
$ ./scripts/kind-up.sh --local-registry 1
```

This will create a local registry, [tilt](https://github.com/tilt-dev/tilt) will
automatically use it to store the docker images.

## Hack it

All steps done by [kind](https://kind.sigs.k8s.io/) and
[tilt](https://github.com/tilt-dev/tilt) can be done manually, first launch the
kind cluster:

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

Those tasks can be done with the `./scripts/up.sh` script. Be warned that
`./scripts/up.sh` will not create and use the local registry.

## Stop and cleanup

To destroy the app, you can run:

```bash
$ tilt down
```

Then destroy the kind cluster:

```bash
$ ./scripts/kind-down.sh
```

For cleanup, you can run:

```bash
$ tilt docker-prune
```
## Notes

- [Resource deps](https://docs.tilt.dev/resource_dependencies.html#other-types-of-dependencies) are not supported for every resource type.
- [k8s_resource](https://docs.tilt.dev/api.html#k8s_resource) can permit to use resource without defining nodePort. The side effect are that the nodePort configuration should be used in CI and 

## License

[MIT](LICENSE)
