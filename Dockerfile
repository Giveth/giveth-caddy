FROM caddy:2.7.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit@bc4310e7cef56ac8c0997d7b3f526b832006307b \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/muety/caddy-remote-host

FROM caddy:2.7.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
