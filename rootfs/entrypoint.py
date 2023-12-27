#!/usr/bin/env python

from flask import Flask, request, Response
from detoxify import Detoxify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def detox():
    text = request.args.get('text')

    results = Detoxify('original').predict(text)

    return Response(str(results), mimetype='application/json')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
