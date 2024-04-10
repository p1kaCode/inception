all :
	mkdir -p /home/user/data/wordpress
	mkdir -p /home/user/data/mariadb
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down : 
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v

re : down all

clean :
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force

.PHONY: all down re clean