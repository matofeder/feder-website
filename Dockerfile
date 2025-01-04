# Dockerfile taken from https://docker.hugomods.com/docs/ci-cd/nginx/

FROM hugomods/hugo:exts as builder
# Base URL
ARG HUGO_BASEURL=
ENV HUGO_BASEURL=${HUGO_BASEURL}
COPY . /src
RUN hugo --minify

FROM hugomods/hugo:nginx
COPY --from=builder /src/public /site
