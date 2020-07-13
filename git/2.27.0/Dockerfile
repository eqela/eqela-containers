FROM alpine:3.12.0 as builder

RUN apk add curl build-base gcc binutils linux-headers
RUN curl -L -O https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.27.0.tar.gz
RUN apk add zlib zlib-dev zlib-static
RUN apk add tcl tk
RUN tar xvf git-2.27.0.tar.gz && cd git-2.27.0 && ./configure --prefix=/ CFLAGS=-static && make && make install

FROM scratch
LABEL maintainer="Eqela <contact@eqela.com>"
COPY --from=builder /bin/git /bin/git
