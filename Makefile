all :
	mkdir ~/home/lmorel/data
	mkdir ~/home/lmorel/data/wordpress
	mkdir ~/home/lmorel/data/mysql
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down : 
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v

re : down all

clean :
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	rm -rf ~/home/lmorel/data/wordpress/*
	rm -rf ~/home/lmorel/data/mysql/*

.PHONY: all down re clean