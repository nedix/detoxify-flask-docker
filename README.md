# detoxify-flask-docker

Docker image to calculate profanity ratings of a given text.
Making use of [Detoxify](https://github.com/unitaryai/detoxify) and Flask.

## Usage

**Start HTTP server on port 1234**

```shell
docker run --rm -p 1234:80 --name detoxify-flask ghcr.io/nedix/detoxify-flask-docker
```

**Fetch profanity ratings**

```shell
curl '127.0.0.1:1234?text=foobar'
```

## Development

1. Clone this repo
2. Execute the `make setup` command
3. Execute the `make up` command
