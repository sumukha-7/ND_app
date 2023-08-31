import json
from flask import Flask, jsonify, request
import random

app = Flask(__name__)
data = None


@app.route('/')
def get_data():
    try:
        with open('data.json', 'r') as f:
            data = json.load(f)
        keys = random.sample(list(data.keys()), 6)
        values = [data[k] for k in keys]
        return dict(zip(keys, values))
    except FileNotFoundError:
        return jsonify({"error": "Data file not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
