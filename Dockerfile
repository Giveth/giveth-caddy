FROM caddy:2.6.4 AS builder

RUN apk add --no-cache git go && \
    GO111MODULE=on go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest && \
    /root/go/bin/xcaddy build \
        --with github.com/mholt/caddy-ratelimit \
        --with github.com/porech/caddy-maxmind-geolocation \
#        --with github.com/RussellLuo/caddy-ext/ratelimit \
        --with github.com/caddyserver/nginx-adapter
#        --with github.com/hayak3/caddy-ratelimit

FROM caddy:2.6.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
