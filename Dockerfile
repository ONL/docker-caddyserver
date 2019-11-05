FROM fedora as builder

RUN dnf install -y wget

WORKDIR /tmp
RUN wget -O caddy.tar.gz "https://caddyserver.com/download/linux/amd64?plugins=http.ipfilter,http.jwt,http.locale,http.login,http.mailout,http.minify,http.prometheus,http.reauth,http.restic,http.webdav&license=personal&telemetry=off"
RUN tar -xz -f /tmp/caddy.tar.gz

FROM scratch
WORKDIR /bin
COPY --from=builder /tmp/caddy /bin/caddy

WORKDIR /etc
WORKDIR /www

VOLUME /etc
VOLUME /www

ENTRYPOINT ["/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--agree=true"]
