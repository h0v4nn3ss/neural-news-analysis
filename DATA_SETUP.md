# CONFIGURACIÓN DE DATOS - NEURAL NEWS ANALYSIS

## Descripción
Este proyecto requiere datasets grandes que no están incluidos en el repositorio Git debido a su tamaño. Sigue estas instrucciones para descargar y configurar los datos necesarios.

## Datasets Requeridos

### 1. Dataset de Noticias Falsas/Verdaderas (news1.csv)
- **Tamaño**: ~29MB
- **Descripción**: Dataset principal para clasificación de noticias falsas
- **Ubicación**: `data/raw/news1.csv`
- **Fuente**: [Proporcionar URL o instrucciones específicas]

### 2. Dataset de Popularidad de Noticias Online (OnlineNewsPopularity.csv)
- **Tamaño**: ~23MB  
- **Descripción**: Dataset de Mashable para predicción de popularidad
- **Ubicación**: `data/raw/OnlineNewsPopularity.csv`
- **Fuente**: UCI Machine Learning Repository
- **URL**: https://archive.ics.uci.edu/ml/datasets/Online+News+Popularity

### 3. Word2Vec de Google News (word2vec_google.bin)
- **Tamaño**: ~3.4GB
- **Descripción**: Vectores pre-entrenados de Word2Vec
- **Ubicación**: `data/raw/word2vec_google.bin`
- **Descarga automática**: El notebook descarga automáticamente este archivo

## Instrucciones de Setup

### Opción 1: Descarga Manual
1. Descargar los datasets desde las URLs proporcionadas
2. Colocar los archivos en la carpeta `data/raw/`
3. Verificar que los nombres coincidan exactamente

### Opción 2: Descarga Automática (Recomendada)
El notebook `neural_news_analysis.ipynb` incluye código para descargar automáticamente los datos necesarios:

```python
# El notebook ejecutará automáticamente:
# - Descarga de Word2Vec de Google News
# - Verificación de archivos locales
# - Configuración de rutas de datos
```

## Verificación de Archivos

Después de la descarga, verifica que tengas la siguiente estructura:

```
data/raw/
├── news1.csv                          # 29MB - Dataset principal
├── OnlineNewsPopularity.csv           # 23MB - Dataset Mashable  
├── news_pred.csv                      # 28KB - Datos de predicción (incluido en Git)
├── GoogleNews-vectors-negative300.txt # URL de descarga (incluido en Git)
└── word2vec_google.bin                # 3.4GB - Vectores Word2Vec
```

## Solución de Problemas

### Error de archivo no encontrado
- Verificar nombres exactos de archivos
- Comprobar rutas relativas en el código
- Ejecutar desde el directorio raíz del proyecto

### Error de memoria al cargar Word2Vec
- Asegurar al menos 8GB de RAM disponible
- Cerrar otras aplicaciones pesadas
- Usar muestreo de datos si es necesario

### Enlaces rotos
- Word2Vec alternativo: https://drive.google.com/file/d/0B7XkCwpI5KDYNlNUTTlSS21pQmM/edit
- Usar `gdown` para descargar desde Google Drive

## Notas Importantes

- Los archivos grandes están excluidos de Git por razones de rendimiento
- El proyecto funciona con datasets de muestra más pequeños para pruebas
- La configuración completa es necesaria para reproducir todos los resultados

## Contacto

Si tienes problemas con la descarga de datos, contacta al autor del proyecto.
