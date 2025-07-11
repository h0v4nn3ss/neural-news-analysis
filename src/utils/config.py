# Configuration file for Neural News Analysis Project
# Configuración del proyecto de análisis de noticias

import os

# Random seed for reproducibility
RANDOM_SEED = 42

# Data parameters
MAX_FEATURES = 80000  # Maximum number of words in vocabulary
MAX_SEQUENCE_LENGTH = 80  # Maximum length of sequences after padding
EMBEDDING_DIM = 300  # Dimension for Word2Vec embeddings

# Model parameters
LSTM_UNITS = 64
DROPOUT_RATE = 0.5
LEARNING_RATE = 0.001
BATCH_SIZE = 32
EPOCHS = 20

# Visualization parameters
FIGURE_SIZE = (12, 6)

# File paths
DATA_PATH = "../data/raw/"
MODELS_PATH = "../models/"
OUTPUTS_PATH = "../outputs/"

# Create directories if they don't exist
os.makedirs(os.path.join(os.path.dirname(__file__), "../../models"), exist_ok=True)
os.makedirs(os.path.join(os.path.dirname(__file__), "../../outputs"), exist_ok=True)

print("Configuration file loaded successfully")
