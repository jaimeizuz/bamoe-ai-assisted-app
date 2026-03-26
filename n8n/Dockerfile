FROM alpine:3.21 AS downloader

ARG OTELCOL_VERSION=0.147.0

RUN apk add --no-cache curl tar && \
    ARCH="$(uname -m)"; \
    case "$ARCH" in \
      x86_64)  OTEL_ARCH="amd64" ;; \
      aarch64) OTEL_ARCH="arm64" ;; \
      *)       echo "Arquitectura no soportada: $ARCH" && exit 1 ;; \
    esac; \
    curl -sSL \
      "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v${OTELCOL_VERSION}/otelcol-contrib_${OTELCOL_VERSION}_linux_${OTEL_ARCH}.tar.gz" \
      -o /tmp/otelcol-contrib.tar.gz; \
    mkdir -p /tmp/otelcol-tmp; \
    tar -xzf /tmp/otelcol-contrib.tar.gz -C /tmp/otelcol-tmp; \
    chmod +x /tmp/otelcol-tmp/otelcol-contrib

# -------------------------------------------------------

FROM n8nio/n8n:2.14.0

COPY --from=downloader /tmp/otelcol-tmp/otelcol-contrib /usr/local/bin/otelcol-contrib

# Configuración de ejemplo: filelog -> OTLP remoto
# Personaliza OTEL_COLLECTOR_ENDPOINT y la ruta del log según tu entorno
COPY otel-collector-config.yaml /etc/otelcol-contrib/config.yaml

USER node
