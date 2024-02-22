#!/bin/bash

# Create directory "Web App"
mkdir "Web App"
cd "Web App" || exit

# Create Python virtual environment
python3 -m venv "Web App Venv"
source "Web App Venv/bin/activate"

# Install Flask
pip install Flask

# Create directory structure
mkdir static templates
mkdir static/css static/js

# Create app.py file
touch app.py

# Create minimal Flask app in app.py
cat <<EOF > app.py
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
EOF

# Create a minimal HTML template file
touch templates/index.html
echo "<h1>Hello, World!</h1>" > templates/index.html

echo "Web App setup complete."
