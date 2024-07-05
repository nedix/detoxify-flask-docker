# [detoxify]-[flask]-docker

A container that serves an HTTP API that can be used to classify the toxicity of a text message.

## Usage

### Start the container

Run the following command to start the server on port `1234`.

```shell
docker run --pull always --rm --name detoxify-flask \
    -p 1234:80 \
    ghcr.io/nedix/detoxify-flask-docker
```

### Send commands over HTTP

Send a network request to classify the toxicity of a text message.

```shell
curl '127.0.0.1:1234?text=foobar'
```

## Attribution

- [Detoxify] ([License](https://raw.githubusercontent.com/unitaryai/detoxify/master/LICENSE))
- [Flask] ([License](https://raw.githubusercontent.com/pallets/flask/main/LICENSE.txt))

[Detoxify]: https://github.com/unitaryai/detoxify
[Flask]: https://github.com/pallets/flask
