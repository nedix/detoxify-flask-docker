# [detoxify-flask-container](https://github.com/nedix/detoxify-flask-container)

HTTP API to classify the toxicity of a text message.

## Usage

### Start the container

Run the following command to start the server on port `8080`.

```shell
docker run --pull always --rm --name detoxify \
    -p 8080:80 \
    nedix/detoxify
```

### Request toxicity metrics

Send a HTTP request to classify the toxicity of a text message.

```shell
curl '127.0.0.1:8080?text=foobar'
```

## Attribution

- [Detoxify] ([License](https://raw.githubusercontent.com/unitaryai/detoxify/master/LICENSE))
- [Flask] ([License](https://raw.githubusercontent.com/pallets/flask/main/LICENSE.txt))

[Detoxify]: https://github.com/unitaryai/detoxify
[Flask]: https://github.com/pallets/flask
