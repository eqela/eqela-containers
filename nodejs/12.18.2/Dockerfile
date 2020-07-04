FROM alpine:3.12.0 as builder

RUN apk add curl python2 build-base gcc abuild binutils binutils-doc gcc-doc linux-headers
RUN curl -L -O https://nodejs.org/dist/v12.18.2/node-v12.18.2.tar.gz
RUN tar xvf node-v12.18.2.tar.gz && cd node-v12.18.2 && ./configure --prefix=/ --fully-static && make && make install

FROM scratch
LABEL maintainer="Eqela <contact@eqela.com>"
COPY --from=builder /bin/node /bin/node
