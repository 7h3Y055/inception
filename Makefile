container=wordpress


start:
	docker build --tag $(container) ./srcs/requirements/$(container)/
	docker run -d --name $(container) -p 9000:9000 $(container)
stop:
	docker container stop $(container)
status:
	docker container ls -a
delall:
	echo y | docker container prune
shell:
	docker exec -it $(container) sh
test:
	docker run -it alpine sh

re:stop delall start