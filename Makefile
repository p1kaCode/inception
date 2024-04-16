all :
	mkdir -p /home/lmorel/data/wordpress
	mkdir -p /home/lmorel/data/mariadb
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down : 
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re : down all

clean :
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker image prune -a --force
	docker network prune --force
	docker volume prune --force
	sudo rm -rf /home/lmorel/data

.PHONY: all down re clean