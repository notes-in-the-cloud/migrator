# syntax=docker/dockerfile:1.7

FROM migrate/migrate:v4.17.1 AS migrate

FROM alpine:3.20

RUN apk add --no-cache ca-certificates tzdata

COPY --from=migrate /usr/local/bin/migrate /usr/local/bin/migrate

COPY migrations /migrations

ENTRYPOINT ["/usr/local/bin/migrate"]