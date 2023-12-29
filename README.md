# [detoxify]-[flask]-docker

HTTP API for classifying toxicity of a given text.

## Setup

#### Start the HTTP server

This example command will start the server on port `80`.

```shell
docker run --rm --name detoxify-flask \
    -p 80:80 \
    ghcr.io/nedix/detoxify-flask-docker
```

## Usage

#### Classify toxicity of a text message

```shell
curl '127.0.0.1:1234?text=foobar'
```

<hr>

## Attribution

Powered by [Detoxify] and [Flask].

[Detoxify]: https://github.com/unitaryai/detoxify
[Flask]: https://github.com/pallets/flask
