SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/chrony
	podman build -t defn/chrony .

push: # Push defn/chrony
	podman push defn/chrony

bash: # Run bash shell with defn/chrony
	podman run --rm -ti --entrypoint bash defn/chrony

exec : # Run bash shell in defn/chrony
	docker-compose exec chrony bash

clean:
	docker-compose down --remove-orphans

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose rm -f -s

recreate:
	$(MAKE) clean
	$(MAKE) up

logs:
	docker-compose logs -f
