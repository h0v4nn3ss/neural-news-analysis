# Plan de Resolución - Modelos Avanzados y Redes Neuronales

## Resumen del Proyecto
Este proyecto involucra dos tareas principales:
1. **Clasificación de noticias falsas** usando redes neuronales recurrentes (LSTM)
2. **Predicción de popularidad de artículos** usando múltiples modelos de machine learning

---

## Configuración Inicial del Proyecto

### 1. Estructura de Carpetas
```
prueba_desafio/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
├── src/
│   ├── preprocessing/
│   ├── models/
│   └── utils/
├── results/
│   ├── plots/
│   └── models/
└── requirements.txt
```

### 2. Configuración del Entorno Conda

#### Entorno Unificado
```bash
# Crear entorno único con todas las dependencias
conda create -n neural_news python=3.9
conda activate neural_news

# Instalar dependencias core
conda install pandas numpy matplotlib seaborn jupyter ipykernel

# Instalar librerías de ML y DL
conda install scikit-learn tensorflow

# Instalar desde conda-forge
conda install -c conda-forge xgboost gensim nltk wordcloud

# Instalar con pip
pip install gdown
```

#### Verificación de la instalación
```python
# Script para verificar que todo está instalado correctamente
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import tensorflow as tf
import sklearn
import xgboost as xgb
import gensim
import nltk
import wordcloud

print("✅ Todas las librerías instaladas correctamente")
print(f"TensorFlow: {tf.__version__}")
print(f"Scikit-learn: {sklearn.__version__}")
print(f"XGBoost: {xgb.__version__}")
```

#### Librerías incluidas:
- **Análisis de datos**: pandas, numpy, matplotlib, seaborn
- **Deep Learning**: tensorflow, keras
- **ML Tradicional**: scikit-learn, xgboost
- **Procesamiento de texto**: nltk, gensim, wordcloud
- **Utilidades**: gdown, jupyter, ipykernel

---

### 3. Configuración Inicial del Proyecto

#### Crear la estructura de carpetas
```bash
# Activar el entorno
conda activate neural_news

# Crear estructura de carpetas
mkdir -p data/{raw,processed}
mkdir -p notebooks
mkdir -p src/{preprocessing,models,utils}
mkdir -p results/{plots,models}

# Crear archivo requirements.txt para documentar dependencias
echo "# Entorno: neural_news
pandas==1.5.3
numpy==1.24.3
matplotlib==3.7.1
seaborn==0.12.2
scikit-learn==1.2.2
tensorflow==2.12.0
xgboost==1.7.5
gensim==4.3.1
nltk==3.8.1
wordcloud==1.9.2
gdown==4.7.1
jupyter==1.0.0" > requirements.txt
```

#### Inicializar el proyecto
```python
# Crear notebook principal
jupyter notebook notebooks/neural_news_analysis.ipynb

# O crear script de verificación
touch src/utils/verify_setup.py
```

---

## PARTE 1: Clasificación de Noticias Falsas (Tareas 1-4)

### Tarea 1: Exploración de Datos
**Objetivo**: Cargar y explorar el dataset `news1.csv`

**Pasos**:
1. Cargar el dataset `news1.csv`
2. Realizar conteo por clase (columna `label`)
3. División train/test (67%/33%)
4. Análisis de frecuencia de palabras
5. Visualizaciones:
   - Distribución de clases
   - Nube de palabras por clase
   - Histograma de longitud de textos

**Código esperado**:
```python
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from wordcloud import WordCloud

# Cargar datos
df = pd.read_csv('data/raw/news1.csv')

# Conteo por clase
print(df['label'].value_counts())

# División train/test
X = df['text']
y = df['label']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)
```

### Tarea 2: Preparación de Datos y Word Embedding
**Objetivo**: Tokenización, padding y creación de matriz de embedding

**Pasos**:
1. Descargar Word2Vec de Google News usando `gdown`
2. Configurar tokenizador (max 80,000 palabras)
3. Aplicar padding (longitud máxima 80)
4. Crear matriz de embedding usando Word2Vec pre-entrenado

**Código esperado**:
```python
import gdown
from gensim.models import KeyedVectors
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

# Descargar Word2Vec
url = 'https://drive.google.com/uc?id=191stTi4bltaYgZX5l-i2mcxjcxjuMNPK'
gdown.download(url, 'word2vec_google.bin', quiet=False)

# Cargar Word2Vec
word2vec_model = KeyedVectors.load_word2vec_format('word2vec_google.bin', binary=True)

# Tokenización
tokenizer = Tokenizer(num_words=80000)
tokenizer.fit_on_texts(X_train)

# Secuencias y padding
X_train_seq = tokenizer.texts_to_sequences(X_train)
X_test_seq = tokenizer.texts_to_sequences(X_test)
X_train_pad = pad_sequences(X_train_seq, maxlen=80)
X_test_pad = pad_sequences(X_test_seq, maxlen=80)

# Matriz de embedding
embedding_matrix = create_embedding_matrix(tokenizer, word2vec_model)
```

### Tarea 3: Modelo LSTM
**Objetivo**: Implementar red neuronal recurrente con >80% accuracy en <20 épocas

**Arquitectura sugerida**:
```python
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense, Dropout

model = Sequential([
    Embedding(vocab_size, 300, weights=[embedding_matrix], trainable=False),
    LSTM(128, dropout=0.3, recurrent_dropout=0.3, return_sequences=True),
    LSTM(64, dropout=0.3, recurrent_dropout=0.3),
    Dense(32, activation='relu'),
    Dropout(0.5),
    Dense(1, activation='sigmoid')
])
```

**Métricas a evaluar**:
- Accuracy
- Precision, Recall, F1-score
- Curva ROC y AUC
- Matriz de confusión

### Tarea 4: Predicciones
**Objetivo**: Predecir sobre `news_pred.csv` y analizar errores

**Pasos**:
1. Cargar `news_pred.csv`
2. Aplicar mismo preprocesamiento
3. Realizar predicciones
4. Analizar casos de error o acierto

---

## PARTE 2: Predicción de Popularidad de Artículos (Tareas 5-11)

### Tarea 5: Exploración de Datos Mashable
**Objetivo**: Cargar y limpiar `OnlineNewsPopularity.csv`

**Pasos**:
1. Cargar dataset
2. Limpiar nombres de columnas (espacios en blanco)
3. Eliminar columnas irrelevantes (ej: URL)
4. Verificar valores ausentes
5. Estadísticas descriptivas

### Tarea 6: Análisis de Outliers y Correlaciones
**Objetivo**: Detectar outliers y variables altamente correlacionadas

**Pasos**:
1. Detectar outliers en variable `shares` (IQR o Z-score)
2. Visualizar distribución antes/después
3. Matriz de correlación
4. Identificar correlaciones >0.7
5. Eliminar variables redundantes

### Tarea 7: Análisis de Distribuciones y Normalización
**Objetivo**: Analizar 4 variables y normalizar datos

**Pasos**:
1. Seleccionar 4 variables numéricas
2. Análisis de distribución (histogramas, QQ-plots)
3. Normalización (StandardScaler o MinMaxScaler)
4. División train/test (67%/33%)

### Tarea 8: Random Forest con Grid Search
**Objetivo**: Optimizar Random Forest con búsqueda de hiperparámetros

**Configuración Grid Search**:
```python
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import GridSearchCV

param_grid = {
    'n_estimators': np.linspace(100, 300, 10, dtype=int),
    'max_depth': np.linspace(2, 15, 10, dtype=int),
    'max_features': ['sqrt', 'log2']
}

grid_search = GridSearchCV(
    RandomForestRegressor(),
    param_grid,
    cv=5,
    scoring='neg_mean_squared_error'
)
```

**Métricas**:
- RMSE
- MAE
- R²

### Tarea 9: Red Neuronal Fully Connected
**Objetivo**: Implementar red densa con regularización

**Arquitectura sugerida**:
```python
model = Sequential([
    Dense(512, activation='relu', input_shape=(n_features,)),
    Dropout(0.3),
    Dense(256, activation='relu'),
    Dropout(0.3),
    Dense(128, activation='relu'),
    Dropout(0.2),
    Dense(1, activation='linear')
])
```

### Tarea 10: XGBoost con Grid Search
**Objetivo**: Implementar Extreme Gradient Boosting optimizado

**Parámetros de búsqueda**:
```python
param_grid = {
    'n_estimators': [100, 120, 150, 200, 300],
    'learning_rate': [0.008, 0.07, 0.009, 0.01, 0.02],
    'subsample': np.linspace(0.05, 1, 5),
    'scale_pos_weight': np.linspace(0.8, 0.9, 2)
}
```

**Análisis adicional**:
- Importancia de características
- Visualización de feature importance

### Tarea 11: Modelo de Bagging
**Objetivo**: Combinar múltiples modelos heterogéneos

**Pasos**:
1. Usar función `util_bagging.bagging_het`
2. Combinar al menos 3 modelos diferentes
3. Evaluar performance del ensemble

### Comparación Final
**Objetivo**: Tabla comparativa de todos los modelos

**Métricas a comparar**:
- RMSE
- MAE
- R²
- Tiempo de entrenamiento

---

## Cronograma Sugerido

### Día 1-2: Configuración y Parte 1
- Configuración del entorno
- Tareas 1-2: Exploración y preparación de datos de noticias
- Tarea 3: Implementación LSTM

### Día 3: Finalización Parte 1
- Tarea 4: Predicciones y análisis
- Documentación de resultados Parte 1

### Día 4-5: Parte 2 - Exploración
- Tarea 5: Exploración datos Mashable
- Tarea 6: Outliers y correlaciones
- Tarea 7: Distribuciones y normalización

### Día 6-7: Parte 2 - Modelos
- Tarea 8: Random Forest
- Tarea 9: Red neuronal densa
- Tarea 10: XGBoost

### Día 8: Finalización
- Tarea 11: Bagging
- Comparación final
- Documentación completa

---

## Consejos de Implementación

### Buenas Prácticas
1. **Reproducibilidad**: Fijar seeds aleatorias
2. **Modularidad**: Crear funciones reutilizables
3. **Documentación**: Comentar código y decisiones
4. **Validación**: Usar cross-validation donde sea apropiado
5. **Visualización**: Crear gráficos informativos

### Gestión de Recursos
1. **Memoria**: Usar batches para datos grandes
2. **Tiempo**: Implementar early stopping
3. **Storage**: Guardar modelos entrenados
4. **Logging**: Registrar métricas durante entrenamiento

### Análisis de Resultados
1. **Interpretabilidad**: Explicar decisiones del modelo
2. **Validación**: Verificar que los resultados tienen sentido
3. **Limitaciones**: Documentar limitaciones y asunciones
4. **Mejoras**: Sugerir posibles mejoras futuras

---

## Entregables Esperados

1. **Notebook principal** con todo el análisis
2. **Scripts modulares** para funciones reutilizables
3. **Visualizaciones** de alta calidad
4. **Modelos entrenados** guardados
5. **Informe de resultados** con conclusiones
6. **Documentación técnica** del código

Este plan proporciona una estructura clara y sistemática para abordar todas las tareas del proyecto de manera eficiente y completa.
