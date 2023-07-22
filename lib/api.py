import json
from flask import Flask, jsonify, request
import random

app = Flask(__name__)
data = None


@app.route('/')
def get_data():
    with open('data.json', 'r') as f:
        data = json.load(f)
    keys = random.sample(list(data.keys()), 6)
    values = [data[k] for k in keys]
    random.shuffle(values)
    return dict(zip(keys, values))


if __name__ == '__main__':
    app.run()
