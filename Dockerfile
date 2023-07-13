FROM caddy:2.6.4-alpine AS builder

RUN apk add --no-cache git go && \
    GO111MODULE=on go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest && \
    /root/go/bin/xcaddy build \
        --with github.com/mholt/caddy-ratelimit \
        --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2.6.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
