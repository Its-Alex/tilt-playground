# Used to pull tanka dependencies before applying the resources
local_resource(
    name='tanka-deps',
    cmd='./tanka/scripts/install-vendors.sh',
    deps=[
        'tanka/lib',
        'tanka/environments',
        'tanka/*.json',
    ],
)

# include('./tiltfiles/k8s-custom-deploy.tilt')
include('./tiltfiles/k8s-yaml.tilt')
