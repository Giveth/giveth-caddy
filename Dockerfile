FROM caddy:2.7.6-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/muety/caddy-remote-host

FROM caddy:2.7.6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
