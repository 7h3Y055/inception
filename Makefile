include srcs/.env

NAME = inception
C_DIR = ./srcs/docker-compose.yml

up: setup build
	docker-compose -f $(C_DIR) -p $(NAME) up -d

build:
	docker-compose -f $(C_DIR) build

stop:
	docker-compose -f $(C_DIR) -p $(NAME) stop

down:
	docker-compose -f $(C_DIR) -p $(NAME) down --rmi all -v
	rm -rf $(HOME_PATH)/data

status:
	@watch --color -t C_DIR=$(C_DIR) NAME=$(NAME) bash ./srcs/requirements/tools/status.sh

logs:
	docker-compose -f $(C_DIR) -p $(NAME) logs $(c)

re: stop up

rebuild: down up


setup:
	LOGIN=$(LOGIN) DOMAIN=$(DOMAIN) bash ./srcs/requirements/tools/setup.sh


	@# rm -rf $(HOME_PATH)/data

# test:
# 	@echo $(DOMAIN)
# 	@# docker run -it alpine sh

# docker rmi $(docker images -aq)


# volumes ????
# Your containers have to restart in case of a crash.
# /home/login/data
# login.42.fr


# For obvious security reasons, any credentials, API keys, env
# variables etc... must be saved locally in a .env file and ignored by
# git. Publicly stored credentials will lead you directly to a failure
# of the project.