all: ui post-py comment prometheus mongodb-exporter

ui: ../src/ui/Dockerfile
	cd ../src/ui/ && ./docker_build.sh && docker push $(USER_NAME)/ui

post-py: ../src/post-py/Dockerfile
	cd ../src/post-py/ && ./docker_build.sh && docker push $(USER_NAME)/post

comment: ../src/comment/Dockerfile
	cd ../src/comment/ && ./docker_build.sh && docker push $(USER_NAME)/comment

prometheus: ../monitoring/prometheus/Dockerfile ../monitoring/prometheus/prometheus.yml
	cd ../monitoring/prometheus && docker build -t xtalf/prometheus .

mongodb-exporter:
	git clone https://github.com/percona/mongodb_exporter.git && cd mongodb_exporter/ && make docker \
	&& cd .. && rm -rf mongodb_exporter

blackbox-exporter:
	cd ../monitoring/blackbox_exporter && docker build -t blackbox:latest .
