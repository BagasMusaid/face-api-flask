from flask import Flask
from .routes import predict_bp
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    CORS(app)  
    app.register_blueprint(predict_bp)
    return app
