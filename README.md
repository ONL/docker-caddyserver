# Caddy
A Custom Caddyserver Dockerimage

## Included Plugins
- http.ipfilter
- http.jwt
- http.locale
- http.login
- http.mailout
- http.minify
- http.prometheus
- http.reauth
- http.restic
- http.webdav
## Running
- The config is expected to reside in `/etc/Caddyfile`, so you should mount it to that location
- A Volume `/www` is exposed to hold the files to serve
- There are no ports exposed by default
- There is no default Caddyfile in the image

Example:
```
docker run -d -p 80:2015 -v /srv/config:/etc -v /srv/www:/www paulritter/caddy
```
