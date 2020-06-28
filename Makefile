#!/usr/bin/make -f

SHELL := /bin/bash


image:
	cd docker && \
	  	 docker build -t phlax/redis .
	git clone https://github.com/gdraheim/docker-copyedit
	./docker-copyedit/docker-copyedit.py FROM phlax/redis INTO phlax/redis:latest REMOVE PORT 6379


docker-push:
	docker push phlax/redis
