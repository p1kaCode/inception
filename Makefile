all : 
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down : 
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v

re : 
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean :
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	rm -rf ~/data/wordpress/*
	rm -rf ~/data/mariadb/*

.PHONY: all down re clean