FROM fedora as builder

RUN dnf upgrade -y \
    & dnf install -y wget

RUN wget -O caddy https://caddyserver.com/download/linux/amd64?plugins=http.ipfilter,http.jwt,http.locale,http.login,http.mailout,http.minify,http.prometheus,http.reauth,http.restic,http.webdav&license=personal&telemetry=off

FROM scratch
COPY --from=builder /caddy /bin/caddy

VOLUME /etc
VOLUME /www

ENTRYPOINT ["/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout", "--agree=$ACME_AGREE"]
