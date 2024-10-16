setup:
	@docker build . -t detoxify

up: PORT = 8080
up:
	@docker run --rm -p $(PORT):80 --name detoxify detoxify
