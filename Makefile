NAME = inception
C_DIR = ./srcs/docker-compose.yml

up: 
	docker-compose -f $(C_DIR) build
	docker-compose -f $(C_DIR) -p $(NAME) up -d

stop:
	docker-compose -f $(C_DIR) -p $(NAME) stop

down:
	docker-compose -f $(C_DIR) -p $(NAME) down --rmi all

status:
	docker-compose -f $(C_DIR) -p $(NAME) ps
	@# @bash ./srcs/requirements/tools/status.sh

re: down up


test:
	docker run -it alpine sh