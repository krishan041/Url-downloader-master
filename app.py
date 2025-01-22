from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "URL Downloader is running successfully!"

if __name__ == "__main__":
    app.run(debug=True)
