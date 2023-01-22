.PHONY: build rebuild login test stop clean
.PHONY: docker ansible

build:
	@docker-compose build
rebuild:
	@docker-compose build --no-cache
login:
	@docker-compose run --rm ansible ash
ansible:
	@docker-compose run --rm ansible ansible-playbook -i ansible/local ansible/site.yml
docker:
	@docker-compose run --rm ansible ansible-playbook -k -K -i docker/local docker/site.yml
stop:
	@docker-compose down
clean: stop
	$(eval _ := $(shell docker images -q -f dangling=true))
	$(eval A := $(if $(_),docker rmi $(_),echo "Already clean."))
	@eval $(A)

