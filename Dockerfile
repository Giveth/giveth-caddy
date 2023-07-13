FROM caddy:2-alpine -builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
