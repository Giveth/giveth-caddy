FROM caddy:2.7.6-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit=89a7fece9addf6881169642d0b8a18e79d58e179 \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/muety/caddy-remote-host

FROM caddy:2.7.6-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
