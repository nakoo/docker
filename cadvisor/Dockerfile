FROM golang:1.14.1-alpine 

ARG VERSION=v0.35.0

RUN apk add --no-cache --virtual .build-deps gcc git make bash libc-dev \
 && mkdir -p $GOPATH/src/github.com/google \
 && git clone https://github.com/google/cadvisor.git $GOPATH/src/github.com/google/cadvisor 

WORKDIR $GOPATH/src/github.com/google/cadvisor

RUN git fetch --tags \
 && git checkout $VERSION \
 && make build \
 && mv cadvisor /cadvisor \
 && apk del .build-deps

# Reference: https://github.com/google/cadvisor/blob/master/deploy/Dockerfile

FROM alpine:latest  

RUN apk --no-cache add libc6-compat device-mapper findutils && \
    apk --no-cache add thin-provisioning-tools --repository http://dl-3.alpinelinux.org/alpine/edge/main/ && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf /var/cache/apk/*

COPY --from=0 /cadvisor /usr/bin/cadvisor

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/healthz || exit 1

ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
