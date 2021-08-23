#
# Build stage
#
FROM ttbb/base:go AS build
COPY . /opt/sh/compile
WORKDIR /opt/sh/compile/pkg
RUN go build -o minio_mate .


FROM ttbb/minio:nake

LABEL maintainer="shoothzj@gmail.com"

ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=password

COPY docker-build /opt/sh/minio/mate

COPY --from=build /opt/sh/compile/pkg/minio_mate /opt/sh/minio/mate/minio_mate

CMD ["/usr/local/bin/dumb-init", "bash", "-vx", "/opt/sh/minio/mate/scripts/start.sh"]