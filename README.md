# hb-store

Packaged the great work of https://github.com/Gkiokan/hb-store-cdn-cli-server in Docker.

To run as docker container run:
> docker run -d -p 8888:8888 -e host=localhost -e port=8888 filipdadgar/hb-store

host=[should be something that is not localhost!]

To run as k8 deployment:

> kubectl create ns hb-store
> kubectl apply -f https://raw.githubusercontent.com/filipdadgar/hb-store/main/hb-store.yaml
> kubectl get pods -n hb-store #to check status for the POD
