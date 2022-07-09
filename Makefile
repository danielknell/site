.DEFAULT_GOAL = help

bootstrap:
	yarn install

#: build the projects output files
build: update
	yarn build

#: run continuous integration tasks
ci:
	exit

clean:
	rm -rf .parcel-cache dist node_modules

#: open a repl console
console:
	yarn node

docs: update
	exit

#: format all source files
format:
	yarn run prettier --write src

#: list avalible make targets
help:
	@grep -B1 -E "^[a-zA-Z0-9_-]+\:([^\=]|$$)" Makefile \
		| grep -v -- -- \
		| sed 'N;s/\n/###/' \
		| sed -n 's/^#: \(.*\)###\(.*\):.*/make \2###    \1/p' \
		| column -t  -s '###' \
		| sort

#: run project server locally
server: update
	yarn run start

#: setup the project after a `git clone`
setup: bootstrap

#: run the projects test suite
test:
	exit

#: update the project after a `git pull`
update: bootstrap

.PHONY: bootstrap build ci clean console docs format help server setup test update