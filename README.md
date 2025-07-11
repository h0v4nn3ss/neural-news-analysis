# Neural News Analysis Project

## Descripción del Proyecto

Proyecto de análisis de noticias utilizando modelos de Machine Learning y Deep Learning para la clasificación de noticias verdaderas y falsas. Implementa técnicas de procesamiento de lenguaje natural (NLP) y redes neuronales LSTM para el análisis de texto.

## Estado Actual del Proyecto

### Datasets Disponibles (data/raw/)
- `news1.csv` (29 MB) - Dataset principal con noticias clasificadas como Verdaderas/Falsas
- `news_pred.csv` (26 KB) - 7 noticias para predicción y análisis
- `OnlineNewsPopularity.csv` (23 MB) - Dataset de Mashable con características de artículos
- `GoogleNews-vectors-negative300.txt` (82 bytes) - URL para descargar Word2Vec de Google News
- `word2vec_google.bin` (3.4 GB) - Modelo Word2Vec pre-entrenado de Google News (descargado)

### Modelos Entrenados (models/)
- `lstm_fake_news_model.h5` (77 MB) - Modelo LSTM entrenado para detección de noticias falsas
- `lstm_fake_news_model.keras` (77 MB) - Modelo LSTM en formato Keras

### Datos Procesados (data/processed/)
- `predictions_results.csv` (684 bytes) - Resultados de predicciones del modelo

### Utilidades Desarrolladas (src/utils/)
- `util_bagging.py` - Función bagging_het para modelos heterogéneos
- `verify_setup.py` - Script de verificación del entorno
- `config.py` - Archivo de configuración del proyecto

### Notebooks de Análisis (notebooks/)
- `environment_setup.ipynb` - Configuración del entorno y instalación de dependencias
- `neural_news_analysis.ipynb` - Notebook principal con análisis completo y entrenamiento de modelos

## Estructura del Proyecto

```
neural-news-analysis/
├── data/
│   ├── raw/                          # Datasets originales
│   │   ├── news1.csv                 # Dataset principal (29 MB)
│   │   ├── news_pred.csv             # Noticias para predicción (26 KB)
│   │   ├── OnlineNewsPopularity.csv  # Dataset Mashable (23 MB)
│   │   ├── GoogleNews-vectors-negative300.txt  # URL Word2Vec
│   │   └── word2vec_google.bin       # Modelo Word2Vec descargado (3.4 GB)
│   └── processed/                    # Datos procesados
│       └── predictions_results.csv   # Resultados de predicciones
├── notebooks/
│   ├── environment_setup.ipynb       # Configuración del entorno
│   └── neural_news_analysis.ipynb    # Análisis principal y entrenamiento
├── src/
│   ├── preprocessing/                # Scripts de preprocesamiento
│   ├── models/                       # Implementaciones de modelos
│   └── utils/                        # Funciones utilitarias
│       ├── util_bagging.py           # Función de bagging heterogéneo
│       ├── verify_setup.py           # Verificación del entorno
│       └── config.py                 # Configuración del proyecto
├── models/                           # Modelos entrenados
│   ├── lstm_fake_news_model.h5       # Modelo LSTM (77 MB)
│   └── lstm_fake_news_model.keras    # Modelo LSTM formato Keras (77 MB)
├── results/
│   ├── plots/                        # Gráficos y visualizaciones
│   └── models/                       # Métricas y evaluaciones de modelos
├── backup/                           # Archivos de respaldo y versiones anteriores
├── docs/                             # Documentación del proyecto
├── requirements.txt                  # Dependencias del proyecto
├── plan_resolucion.md               # Plan de trabajo y metodología
└── instrucciones.md                 # Instrucciones originales del proyecto
```

## Estado de Desarrollo

| Componente | Estado | Descripción |
|------------|--------|-------------|
| Entorno | ✓ Configurado | Python 3.11, dependencias instaladas |
| Datasets | ✓ Disponibles | Todos los datasets descargados y organizados |
| Word2Vec | ✓ Descargado | Modelo Google News (3.4 GB) disponible |
| Preprocesamiento | ✓ Implementado | Limpieza y tokenización de texto |
| Modelos ML | ✓ Entrenados | SVM, Random Forest, XGBoost |
| Modelo LSTM | ✓ Entrenado | Red neuronal LSTM para clasificación |
| Evaluación | ✓ Completada | Métricas y comparación de modelos |
| Predicciones | ✓ Realizadas | Análisis de 7 noticias de prueba |

## Tecnologías Utilizadas

### Librerías Principales
- **Análisis de datos**: pandas (2.3.1), numpy (1.26.4)
- **Visualización**: matplotlib (3.9.4), seaborn (0.13.2)
- **Deep Learning**: tensorflow (2.18.0), keras (3.10.0)
- **Machine Learning**: scikit-learn (1.6.1), xgboost (2.1.4)
- **NLP**: nltk (3.9.1), gensim (4.3.3), wordcloud (1.9.4)
- **Utilidades**: gdown (5.2.0), jupyter (1.1.1), tqdm (4.67.1)

### Modelos Implementados
1. **Support Vector Machine (SVM)** - Clasificación con vectores de soporte
2. **Random Forest** - Ensemble de árboles de decisión
3. **XGBoost** - Gradient boosting optimizado
4. **LSTM Neural Network** - Red neuronal recurrente para secuencias de texto

## Resultados Principales

- **Modelo LSTM entrenado** con arquitectura optimizada para clasificación de texto
- **Comparación de modelos** tradicionales vs. deep learning
- **Análisis de 7 noticias de prueba** con predicciones del modelo
- **Visualizaciones** de distribución de datos y métricas de evaluación

## Cómo Usar el Proyecto

### Prerrequisitos
```bash
# Crear entorno virtual
python -m venv .venv
source .venv/bin/activate  # En macOS/Linux
# .venv\Scripts\activate   # En Windows

# Instalar dependencias
pip install -r requirements.txt
```

### Ejecución
1. **Configurar entorno**: Ejecutar `notebooks/environment_setup.ipynb`
2. **Análisis completo**: Ejecutar `notebooks/neural_news_analysis.ipynb`
3. **Verificar setup**: Ejecutar `python src/utils/verify_setup.py`

## Próximos Pasos

1. **Optimización de hiperparámetros** del modelo LSTM
2. **Implementación de nuevas arquitecturas** (BERT, Transformers)
3. **Análisis de explicabilidad** de las predicciones
4. **API REST** para predicciones en tiempo real
5. **Interfaz web** para interacción con el modelo

---

## Contacto y Documentación

- **Repositorio**: [neural-news-analysis](https://github.com/h0v4nn3ss/neural-news-analysis)
- **Documentación adicional**: Ver carpeta `docs/` y archivos `.md` en el proyecto
- **Plan de resolución**: `plan_resolucion.md`

**Proyecto completado con éxito - Todos los modelos entrenados y evaluados**
