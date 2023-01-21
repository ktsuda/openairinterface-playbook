.PHONY: build rebuild login stop clean

build:
	@docker-compose build
rebuild:
	@docker-compose build --no-cache
login:
	@docker-compose run --rm ansible ash
stop:
	@docker-compose down
clean: stop
	$(eval _ := $(shell docker images -q -f dangling=true))
	$(eval A := $(if $(_),docker rmi $(_),echo "Already clean."))
	@eval $(A)

