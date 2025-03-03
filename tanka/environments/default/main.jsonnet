local flaskHelloWorld = import '../../lib/flask-hello-world.libsonnet';

{
  deployment: flaskHelloWorld.deployment,
  service: flaskHelloWorld.service,
}
