"""
Flask Application for CI/CD Pipeline Assignment
Course: Cloud MLOps (BS AI)
Authors: Saamer Abbas (22i-0468), Ali hassan (22i-0541)
"""

from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/')
def hello_world():
    """
    Simple hello world endpoint
    """
    return jsonify({
        'message': 'Hello, World!',
        'project': 'Flask K8s CI/CD Assignment',
        'members': [
            {'name': 'Saamer Abbas', 'id': '22i-0468', 'role': 'Admin'},
            {'name': 'Ali hassan', 'id': '22i-0541', 'role': 'Developer'}
        ]
    })


@app.route('/health')
def health_check():
    """
    Health check endpoint for K8s probes
    """
    return jsonify({'status': 'healthy'}), 200


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
