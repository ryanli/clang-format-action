FROM alpine:3.19

RUN apk add --no-cache git clang-extra-tools python3

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER 1001:121

ENTRYPOINT ["/entrypoint.sh"]
