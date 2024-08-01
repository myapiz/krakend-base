FROM alpine:latest

ARG KRAKEND_VERSION=2.7.0

RUN apk add --no-cache ca-certificates && \
    apk add gpg gpg-agent wget libc6-compat

# downloading krakend
RUN gpg --keyserver keyserver.ubuntu.com --recv-key 5DE6FD698AD6FDD2 && \
    wget https://repo.krakend.io/bin/krakend_${KRAKEND_VERSION}_amd64_generic-linux.tar.gz && \
    wget https://repo.krakend.io/bin/krakend_${KRAKEND_VERSION}_amd64_generic-linux.tar.gz.asc
# installing krakend
RUN gpg --verify krakend_${KRAKEND_VERSION}_amd64_generic-linux.tar.gz.asc krakend_${KRAKEND_VERSION}_amd64_generic-linux.tar.gz && \
    tar -zxf krakend_${KRAKEND_VERSION}_amd64_generic-linux.tar.gz && \
    chmod +x /usr/bin/krakend

ENTRYPOINT [ "/usr/bin/krakend" ]

CMD ["run", "-c", "/etc/krakend/krakend.json"]

EXPOSE 9090