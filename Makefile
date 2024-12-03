.PHONY: up pre-up stacks-up down link pre-link link-stacks unlink

all: up

pre-up:
	./scripts/pre-up.sh

stacks-up:
	./scripts/stacks-up.sh

up: pre-up stacks-up

down:
	./scripts/down.sh

pre-link:
	./scripts/pre-link.sh

link-stacks:
	./scripts/link-stacks.sh

link: pre-link link-stacks

unlink:
	./scripts/unlink.sh
