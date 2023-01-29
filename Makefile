setup:
	@docker build . -t detoxify-flask

up:
	@docker run --rm -p 1234:80 --name detoxify-flask detoxify-flask
