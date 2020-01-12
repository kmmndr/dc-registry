all: up passwd

.PHONY: pull
pull:
	./remote.sh docker-compose pull

.PHONY: up
up: pull
	./remote.sh docker-compose up -d

.PHONY: clean
clean:
	./remote.sh docker-compose down
	./remote.sh docker-compose kill
	./remote.sh docker-compose rm

.PHONY: passwd
passwd:
	@echo "Changing password for user 'docker'"
	./remote.sh docker-compose run --entrypoint htpasswd registry -cB /auth/htpasswd docker
