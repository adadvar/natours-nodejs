PRODUCTION=
COMPOSE_FILES=docker-compose.yml

help:
	@echo "";
	@echo "build"
	@echo "  Build docker image and start containers."
	@echo ""
	@echo "up"
	@echo "  Create and start containers."
	@echo ""
	@echo "status"
	@echo "  Shows the status of the current containers."
	@echo ""
	@echo "shell"
	@echo "  Starting a zsh shell as \"www-data\" user in web container."
	@echo ""
	@echo "shell-as-root"
	@echo "  Starting a bash shell as \"root\" user in web container."
	@echo ""
	@echo "down"
	@echo "  Stop and remove containers, networks, images, and volumes."
	@echo ""


build:
	docker compose -f $(COMPOSE_FILES) up -d --build

up:
	docker compose -f $(COMPOSE_FILES) up

status:
	docker compose -f $(COMPOSE_FILES) ps

down:
	docker compose -f $(COMPOSE_FILES) down

shell:
	# docker compose -f $(COMPOSE_FILES) exec --user=www-data app ash
	docker exec -it divar-app bash

shell-n:
	docker exec -it nextjs /bin/sh

shell-as-root:
	docker compose -f $(COMPOSE_FILES) exec  --user=root app ash

kill:
	docker stop $$(docker ps -a -q)