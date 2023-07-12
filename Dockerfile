kFROM caddy:2-alpine -builder AS builder

RUN xcaddy build \
    --with github.com/RussellLuo/caddy-ext/ratelimit
    --with github.com/zhangjiayin/caddy-geoip2
    --with github.com/mholt/caddy-ratelimit

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
