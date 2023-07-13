# Caddy giveth
[![ci](https://github.com/Giveth/giveth-caddy/actions/workflows/ci.yml/badge.svg)](https://github.com/Giveth/giveth-caddy/actions/workflows/ci.yml)
We want a specific Caddy Web Server Image that works with our Giveth-All stack. We are using this as a migration from nginx. This is a 
specific caddy build that supports the below:
1. Rate Limiting
2. GeoBlocking & Control
## Usage
You can find the docker-compose configuration snippet example here:
```
  caddy:
    image: ghcr.io/giveth/giveth-caddy:latest
    container_name: caddy
    restart: unless-stopped
    networks:
      - giveth-all
    ports:
      - 80:80
      - 443:443
    env_file:
      - .env
    environment:
      IMPACT_GRAPH_URL: ${IMPACT_GRAPH_URL:-}
      AUTH_SERVICE_URL: ${AUTH_SERVICE_URL:-}
      NOTIFICATION_CENTER_URL: ${NOTIFICATION_CENTER_URL:-}
      APIGIV_URL = ${APIGIV_URL:-}
      RESTRICTED_PATHS: ${RESTRICTED_PATHS:-}
      IP_WHITELIST: ${IP_WHITELIST:-}
    volumes:
      - caddy_data:/data
      - caddy_config:/config
      - ./Caddyfile:/etc/caddy/Caddyfile
```
