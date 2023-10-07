from flask import Flask, jsonify, request
import random
import sqlite3

app = Flask(__name__)

DB_PATH = 'C:/Users/Sumukha/firstproject/mobile_app_dev/NihongoDekita/nihongo_dekita/lib/data/kanji_vocab.db'

# Utility function to get a database connection
def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/vocab', methods=['GET'])
def get_vocab():
    return get_questions('vocab')

@app.route('/kanji', methods=['GET'])
def get_kanji():
    return get_questions('kanji')

def get_questions(data_type):
    conn = get_db_connection()
    cursor = conn.cursor()

    if data_type == 'vocab':
        cursor.execute('SELECT * FROM vocab')
    elif data_type == 'kanji':
        cursor.execute('SELECT * FROM kanji')
    else:
        return jsonify({"error": "Invalid type provided"}), 400
    
    data = {row['key']: row['value'] for row in cursor.fetchall()}
    conn.close()

    keys = random.sample(list(data.keys()), 6)
    
    questions_list = []
    
    for i, key in enumerate(keys):
        options = random.sample([v for k, v in data.items() if k != key], 3)
        
        correct_index = random.randint(0, 3)
        options.insert(correct_index, data[key])

        question_object = {
            "id": i + 1,
            "question": f"What is the meaning of {key}?",
            "options": options,
            "answer_index": correct_index
        }

        questions_list.append(question_object)

    return jsonify(questions_list)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
