from flask import Flask
from flask_cors import CORS
from .routes import predict_bp

def create_app():
    app = Flask(__name__)
    CORS(app, resources={r"/*": {"origins": "*"}})
    
    # Register blueprint
    app.register_blueprint(predict_bp)
    
    return app