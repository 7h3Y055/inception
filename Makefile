include srcs/.env

NAME  = inception
C_DIR = ./srcs/docker-compose.yml

up: setup build
	@docker-compose -f $(C_DIR) -p $(NAME) up -d

build:
	@docker-compose -f $(C_DIR) build

stop:
	@docker-compose -f $(C_DIR) -p $(NAME) stop

down:
	@docker-compose -f $(C_DIR) -p $(NAME) down --rmi all -v
	@echo "[+] Remove Local Data Files"
	@rm -rf $(HOME_PATH)/data #HERE

status:
	@watch -n 0.1 --color -t C_DIR=$(C_DIR) NAME=$(NAME) bash ./srcs/requirements/tools/status.sh

re:
	@docker-compose -f $(C_DIR) -p $(NAME) restart

rebuild: down up


setup:
	@LOGIN=$(LOGIN) DOMAIN=$(DOMAIN) bash ./srcs/requirements/tools/setup.sh






# logs:
# 	docker-compose -f $(C_DIR) -p $(NAME) logs $(c) # remove it

# nginx script
# wordpress config
# wordpress Dockerfile