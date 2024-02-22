#!/bin/bash

# Create directory "Web App"
mkdir "Web App"
cd "Web App"

# Create Python virtual environment
python3 -m venv "Web App Venv"
source "Web App Venv/bin/activate"

# Install Flask
pip install Flask

# Create directory structure
mkdir static templates

# Clone the repository containing HTML, CSS, and JS files
git clone https://github.com/mandreesen-borowitz/web_application.git temp_repo

# Copy HTML files to templates directory
cp temp_repo/*.html templates/

# Copy CSS files to static/css directory
cp temp_repo/*.css static/css/

# Copy JS files to static/js directory
cp temp_repo/*.js static/js/

# Remove the temporary repository
rm -rf temp_repo

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
