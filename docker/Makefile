all: ui post-py comment prometheus fluentd

ui: ../src/ui/Dockerfile
	cd ../src/ui/ && ./docker_build.sh && docker push $(USER_NAME)/ui

post-py: ../src/post-py/Dockerfile
	cd ../src/post-py/ && ./docker_build.sh && docker push $(USER_NAME)/post

comment: ../src/comment/Dockerfile
	cd ../src/comment/ && ./docker_build.sh && docker push $(USER_NAME)/comment

prometheus: ../monitoring/prometheus/Dockerfile ../monitoring/prometheus/prometheus.yml
	cd ../monitoring/prometheus && docker build -t xtalf/prometheus .

fluentd: ../logging/fluentd/Dockerfile ../logging/fluentd/fluent.conf
	cd ../logging/fluentd && docker build -t xtalf/fluentd .

#mongodb-exporter:
#	git clone https://github.com/percona/mongodb_exporter.git && cd mongodb_exporter/ && make docker \
#	&& cd .. && rm -rf mongodb_exporter

#blackbox-exporter:
#	cd ../monitoring/blackbox_exporter && docker build -t blackbox:latest .

#alertmanager:
#	cd ../monitoring/alertmanager && docker build -t $(USER_NAME)/alertmanager . && docker push $(USER_NAME)/comment

#telegraf:
#	cd ../monitoring/telegraf && docker build -t telegraf .
