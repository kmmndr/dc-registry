default: help
include *.mk

start: docker-compose-start ##- Start
deploy: docker-compose-deploy ##- Deploy (start remotely)

.PHONY: passwd
passwd: environment
	@echo "Changing password for user 'docker'"
	$(load_env); docker-compose run --entrypoint htpasswd registry -cB /auth/htpasswd docker
