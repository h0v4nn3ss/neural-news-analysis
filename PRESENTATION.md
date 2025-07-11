# NEURAL NEWS ANALYSIS - PRESENTACIÓN ACADÉMICA

## Resumen Ejecutivo

**Proyecto**: Análisis Neuronal de Noticias  
**Objetivo**: Clasificación de noticias falsas y predicción de popularidad usando redes neuronales  
**Tecnologías**: Python, TensorFlow/Keras, LSTM, Scikit-learn  
**Datasets**: ~52MB de datos textuales y numéricos  

## Resultados Principales

### 1. Clasificación de Noticias Falsas (LSTM)
- **Modelo**: Red neuronal recurrente LSTM
- **Accuracy**: [Incluir resultado final]
- **Precision**: [Incluir métricas]
- **Recall**: [Incluir métricas]

### 2. Predicción de Popularidad (Ensemble)
- **Mejores modelos**: Random Forest, XGBoost, Voting Regressor
- **RMSE**: [Incluir resultado final]
- **R²**: [Incluir resultado final]
- **Técnicas**: Bagging, Grid Search, Cross-validation

## Metodología

### Preprocesamiento
- Limpieza y tokenización de texto
- Manejo de outliers y valores faltantes
- Normalización de datos numéricos
- Word embeddings con Word2Vec

### Modelado
- Arquitectura LSTM para clasificación
- Ensemble de modelos tradicionales para regresión
- Optimización de hiperparámetros
- Validación cruzada estratificada

### Evaluación
- Métricas de clasificación (accuracy, precision, recall, F1)
- Métricas de regresión (RMSE, R², MAE)
- Análisis de residuos y overfitting
- Comparación de modelos

## Estructura del Proyecto

```
neural-news-analysis/
├── notebooks/           # Análisis principal y setup
├── src/utils/          # Funciones de utilidad
├── data/raw/           # Datos originales (parcial)
├── results/            # Resultados y visualizaciones
└── docs/               # Documentación
```

## Reproducibilidad

### Setup Rápido
```bash
# Clonar repositorio
git clone https://github.com/[usuario]/neural-news-analysis.git
cd neural-news-analysis

# Instalar dependencias
pip install -r requirements.txt

# Configurar datos (ver DATA_SETUP.md)
# Ejecutar notebooks en orden
```

### Archivos Clave
- `neural_news_analysis.ipynb`: Análisis completo
- `requirements.txt`: Dependencias Python
- `DATA_SETUP.md`: Instrucciones de datos
- `src/utils/`: Funciones reutilizables

## Hallazgos Técnicos

### Insights del Texto
- Palabras más discriminativas entre noticias falsas/reales
- Patrones de longitud y complejidad textual
- Importancia de embeddings pre-entrenados

### Insights de Popularidad
- Factores más influyentes en viralidad
- Importancia del timing de publicación
- Correlaciones entre métricas sociales

## Tecnologías Utilizadas

**Deep Learning**
- TensorFlow 2.18.0
- Keras 3.10.0
- LSTM, Dense layers

**Machine Learning**
- Scikit-learn 1.6.1
- XGBoost 2.1.4
- Ensemble methods

**Procesamiento de Texto**
- NLTK 3.9.1
- Gensim 4.3.3
- Word2Vec embeddings

**Análisis de Datos**
- Pandas 2.3.1
- NumPy 1.26.4
- Matplotlib, Seaborn

## Próximos Pasos

1. **Optimización**: Pruning de modelos, quantización
2. **Despliegue**: API REST, contenedores Docker
3. **Monitoreo**: Drift detection, reentrenamiento
4. **Extensión**: Análisis de sentimientos, clasificación multiclase

## Enlaces

- **Repositorio**: [GitHub URL]
- **Documentación**: Ver `README.md`
- **Datos**: Ver `DATA_SETUP.md`
- **Notebook principal**: `notebooks/neural_news_analysis.ipynb`

---

**Presentado por**: [Tu nombre]  
**Curso**: Data Science  
**Fecha**: Julio 2025
