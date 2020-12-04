FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add grafana --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/

COPY	datasources.yaml /usr/share/grafana/conf/provisioning/datasources/sample.yaml
COPY 	dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY 	./dashboards/* /var/lib/grafana/dashboards/
COPY	./start.sh /

RUN chmod +x start.sh
EXPOSE 3000

ENTRYPOINT ./start.sh
