#!/bin/bash

help: # Shows this help message
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

start: ## Starts all containers
	cd platform && $(MAKE) start
	cd notifier && $(MAKE) start
	cd rabbitmq && $(MAKE) start

stop: ## Stops all containers
	cd platform && $(MAKE) stop
	cd notifier && $(MAKE) stop
	cd rabbitmq && $(MAKE) stop

restart: ## Restarts all containers
	cd platform && $(MAKE) stop && $(MAKE) run
	cd notifier && $(MAKE) stop && $(MAKE) run
	cd rabbitmq && $(MAKE) stop && $(MAKE) run
