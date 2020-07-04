FROM alpine:3.10.2 as builder
USER root
RUN mkdir /eqelart
RUN wget https://files.eqela.com/eqelart/6.x/eqelart-6.0.8_linux.zip
RUN unzip eqelart-6.0.8_linux.zip -d /eqelart
RUN mkdir /new_tmp /new_home

FROM scratch
LABEL maintainer="Eqela <contact@eqela.com>"
COPY --from=builder /eqelart/eqela /eqela
COPY --from=builder /new_tmp /tmp
COPY --from=builder /new_home /home
ENV HOME /home
WORKDIR /home
