FROM golang:1.11

WORKDIR /go/src/blackbox_exporter

RUN git clone -b 'v0.13.0' --single-branch --depth 1 https://github.com/prometheus/blackbox_exporter.git .
RUN make build

FROM        quay.io/prometheus/busybox:latest
COPY --from=0 /go/src/blackbox_exporter/blackbox_exporter  /bin/blackbox_exporter
COPY blackbox.yml       /etc/blackbox_exporter/config.yml

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml" ]
