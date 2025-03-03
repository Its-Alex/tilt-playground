{
  deployment: {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      name: 'flask-hello-world',
      labels: {
        app: 'flask-hello-world',
      },
    },
    spec: {
      replicas: 1,
      selector: {
        matchLabels: {
          app: 'flask-hello-world',
        },
      },
      template: {
        metadata: {
          labels: {
            app: 'flask-hello-world',
            'deployment-timestamp': std.extVar('timestamp'),
          },
        },
        spec: {
          containers: [
            {
              name: 'flask-hello-world',
              image: 'flask-hello-world:latest',
              imagePullPolicy: 'Never',
              ports: [
                {
                  containerPort: 8080,
                },
              ],
            },
          ],
        },
      },
    },
  },
  service: {
    apiVersion: 'v1',
    kind: 'Service',
    metadata: {
      name: 'flask-hello-world',
    },
    spec: {
      type: 'NodePort',
      ports: [
        {
          port: 8080,
          targetPort: 8080,
          nodePort: 30001,
        },
      ],
      selector: {
        app: 'flask-hello-world',
      },
    },
  },
}
