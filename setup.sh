#!/bin/bash

# Create directory "Web App"
mkdir "Web App"
cd "Web App"

# Create Python virtual environment
python3 -m venv "Web App Venv"
source "Web App Venv/bin/activate"

# Install Flask
pip install --upgrade pip
pip install Flask

# Create directory structure
mkdir static static/css static/js templates

# Copy HTML files to templates directory
cp app_files/*.html templates/

# Copy CSS files to static/css directory
cp app_files/*.css static/css/

# Copy JS files to static/js directory
cp app_files/*.js static/js/

# Remove the temporary repository
rm -rf app_files

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

echo "Web App setup complete."
