FROM caddy:2.7.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit@2dc0d586f0b87e983757c403bc0929ddeb84a537 \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/muety/caddy-remote-host

FROM caddy:2.7.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
