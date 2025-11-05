from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__)

# Route for homepage
@app.route('/')
def home():
    return render_template('index.html')

# Route to serve image from static/images/
@app.route('/images/<filename>')
def serve_image(filename):
    return send_from_directory('static/images', filename)

if __name__ == '__main__':
    # Optional: make host accessible externally if needed
    app.run(host='0.0.0.0', port=5000, debug=True)

