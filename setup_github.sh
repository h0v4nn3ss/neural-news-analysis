#!/bin/bash

# =============================================================================
# SCRIPT DE IMPLEMENTACIÓN - NEURAL NEWS ANALYSIS PARA GITHUB
# =============================================================================
# Este script implementa el plan para subir el proyecto a Git y GitHub
# Fecha: Julio 11, 2025
# Proyecto: Neural News Analysis
# Para: Clase de Data Science
# =============================================================================

set -e  # Salir si hay errores

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir con colores
print_step() {
    echo -e "${BLUE}[PASO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Verificar que estamos en el directorio correcto
if [[ ! -f "GITHUB_SETUP_PLAN.md" ]]; then
    print_error "No se encuentra GITHUB_SETUP_PLAN.md. Ejecuta desde el directorio del proyecto."
    exit 1
fi

echo "============================================================================="
echo "               IMPLEMENTACIÓN DE NEURAL NEWS ANALYSIS PARA GITHUB"
echo "============================================================================="
echo ""

# =============================================================================
# FASE 1: PREPARACIÓN DEL REPOSITORIO LOCAL
# =============================================================================

print_step "FASE 1: Preparación del Repositorio Local"
echo ""

# 1.1 Crear .gitignore optimizado
print_step "1.1 Creando .gitignore optimizado..."
cat > .gitignore << 'EOF'
# Datos grandes (excluir de Git)
data/raw/word2vec_google.bin
data/raw/news1.csv
data/raw/OnlineNewsPopularity.csv
data/raw/*.bin
data/raw/*.csv
!data/raw/news_pred.csv
!data/raw/GoogleNews-vectors-negative300.txt

# Modelos entrenados
models/*.h5
models/*.keras
models/*.pkl
models/*.joblib
*.h5
*.keras
*.pkl

# Archivos de respaldo
backup/
*_backup/
*_v[0-9]/
*_v[0-9][0-9]/

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Jupyter Notebook
.ipynb_checkpoints

# Entornos virtuales
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# IDEs
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs y temporales
*.log
*.tmp
*.temp
logs/
temp/
outputs/temp/

# Datos procesados grandes
data/processed/*.csv
data/processed/*.pkl
!data/processed/.gitkeep

# Resultados grandes
results/models/*.h5
results/models/*.keras
results/plots/*.png
results/plots/*.jpg
!results/models/.gitkeep
!results/plots/.gitkeep
EOF

print_success ".gitignore creado exitosamente"

# 1.2 Crear DATA_SETUP.md
print_step "1.2 Creando DATA_SETUP.md con instrucciones de descarga..."
cat > DATA_SETUP.md << 'EOF'
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
EOF

print_success "DATA_SETUP.md creado exitosamente"

# 1.3 Crear PRESENTATION.md
print_step "1.3 Creando PRESENTATION.md para la clase..."
cat > PRESENTATION.md << 'EOF'
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
EOF

print_success "PRESENTATION.md creado exitosamente"

# 1.4 Crear .gitkeep para carpetas vacías
print_step "1.4 Creando .gitkeep para mantener estructura de carpetas..."

# Crear carpetas y .gitkeep si no existen
mkdir -p data/processed results/plots results/models docs
touch data/processed/.gitkeep
touch results/plots/.gitkeep  
touch results/models/.gitkeep
touch docs/.gitkeep

print_success "Estructura de carpetas configurada"

# 1.5 Limpiar archivos temporales
print_step "1.5 Limpiando archivos temporales..."
find . -name "*.pyc" -delete 2>/dev/null || true
find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
find . -name ".DS_Store" -delete 2>/dev/null || true
find . -name "*.tmp" -delete 2>/dev/null || true
find . -name "*.log" -delete 2>/dev/null || true

print_success "Archivos temporales eliminados"

# =============================================================================
# FASE 2: INICIALIZACIÓN DE GIT
# =============================================================================

print_step "FASE 2: Inicializando repositorio Git"
echo ""

# 2.1 Verificar si ya existe repositorio Git
if [[ -d ".git" ]]; then
    print_warning "Repositorio Git ya existe. ¿Desea reinicializar? (y/N)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        rm -rf .git
        print_step "Repositorio Git anterior eliminado"
    else
        print_step "Manteniendo repositorio Git existente"
    fi
fi

# 2.2 Inicializar Git
if [[ ! -d ".git" ]]; then
    print_step "2.1 Inicializando repositorio Git..."
    git init
    print_success "Repositorio Git inicializado"
else
    print_success "Usando repositorio Git existente"
fi

# 2.3 Configurar usuario (si no está configurado)
print_step "2.2 Verificando configuración de Git..."
if ! git config user.name &>/dev/null; then
    print_warning "Configuración de Git no encontrada. Ingresa tu nombre:"
    read -r git_name
    git config user.name "$git_name"
fi

if ! git config user.email &>/dev/null; then
    print_warning "Configuración de email no encontrada. Ingresa tu email:"
    read -r git_email
    git config user.email "$git_email"
fi

print_success "Configuración de Git verificada"

# 2.4 Agregar archivos al staging
print_step "2.3 Agregando archivos al staging area..."

# Agregar archivos específicos
git add .gitignore
git add DATA_SETUP.md
git add PRESENTATION.md
git add GITHUB_SETUP_PLAN.md
git add README.md
git add requirements.txt
git add plan_resolucion.md 2>/dev/null || true
git add instrucciones.md 2>/dev/null || true

# Agregar notebooks
git add notebooks/ 2>/dev/null || true

# Agregar código fuente
git add src/ 2>/dev/null || true

# Agregar datos pequeños permitidos
git add data/raw/news_pred.csv 2>/dev/null || true
git add data/raw/GoogleNews-vectors-negative300.txt 2>/dev/null || true

# Agregar .gitkeep files
git add data/processed/.gitkeep
git add results/plots/.gitkeep
git add results/models/.gitkeep
git add docs/.gitkeep

print_success "Archivos agregados al staging area"

# 2.5 Verificar qué se va a commitear
print_step "2.4 Archivos que serán incluidos en el commit:"
git status --porcelain
echo ""

# 2.6 Crear primer commit
print_step "2.5 Creando commit inicial..."
git commit -m "Initial commit: Neural News Analysis project

- Add core notebooks and source code
- Add project documentation and setup instructions  
- Add requirements and configuration files
- Exclude large datasets (see DATA_SETUP.md)
- Ready for academic presentation"

print_success "Commit inicial creado exitosamente"

# =============================================================================
# FASE 3: PREPARACIÓN PARA GITHUB
# =============================================================================

print_step "FASE 3: Preparación para GitHub"
echo ""

# 3.1 Mostrar estadísticas del repositorio
print_step "3.1 Estadísticas del repositorio:"
echo "Archivos trackeados por Git:"
git ls-files | wc -l | xargs echo "- Total de archivos:"

echo "Tamaño del repositorio:"
du -sh .git 2>/dev/null | cut -f1 | xargs echo "- Tamaño de .git:"

echo "Archivos más grandes incluidos:"
git ls-files | xargs ls -lh | sort -k5 -hr | head -5

echo ""

# 3.2 Verificar que archivos grandes están excluidos
print_step "3.2 Verificando exclusiones importantes..."

excluded_files=(
    "data/raw/word2vec_google.bin"
    "data/raw/news1.csv" 
    "data/raw/OnlineNewsPopularity.csv"
    "backup/"
)

for file in "${excluded_files[@]}"; do
    if [[ -e "$file" ]] && git check-ignore "$file" &>/dev/null; then
        print_success "✓ $file correctamente excluido"
    elif [[ -e "$file" ]]; then
        print_warning "! $file existe pero no está excluido"
    else
        print_success "✓ $file no existe (OK)"
    fi
done

echo ""

# 3.3 Generar comandos para GitHub
print_step "3.3 Generando comandos para conectar con GitHub..."

cat > github_commands.sh << 'EOF'
#!/bin/bash

# =============================================================================
# COMANDOS PARA CONECTAR CON GITHUB
# =============================================================================
# Ejecuta estos comandos después de crear el repositorio en GitHub

echo "1. Crea un nuevo repositorio en GitHub con el nombre: neural-news-analysis"
echo "2. Configura como repositorio público"  
echo "3. NO inicialices con README (ya tenemos uno)"
echo "4. Ejecuta los siguientes comandos:"
echo ""

echo "# Agregar remote origin (reemplaza [usuario] con tu usuario de GitHub)"
echo "git remote add origin https://github.com/[usuario]/neural-news-analysis.git"
echo ""

echo "# Crear y cambiar a rama main (si no existe)"
echo "git branch -M main"
echo ""

echo "# Push inicial"
echo "git push -u origin main"
echo ""

echo "5. Verifica que el repositorio aparezca correctamente en GitHub"
echo "6. Comparte la URL del repositorio para tu presentación"
EOF

chmod +x github_commands.sh

print_success "Comandos de GitHub guardados en 'github_commands.sh'"

# =============================================================================
# FINALIZACIÓN
# =============================================================================

echo ""
echo "============================================================================="
print_success "IMPLEMENTACIÓN COMPLETADA EXITOSAMENTE"
echo "============================================================================="
echo ""

print_step "RESUMEN DE ACCIONES REALIZADAS:"
echo "✓ .gitignore optimizado creado"
echo "✓ DATA_SETUP.md con instrucciones de datos" 
echo "✓ PRESENTATION.md para la clase"
echo "✓ Estructura de carpetas configurada"
echo "✓ Repositorio Git inicializado"
echo "✓ Commit inicial creado"
echo "✓ Archivos grandes excluidos correctamente"
echo ""

print_step "PRÓXIMOS PASOS:"
echo "1. Revisar los archivos creados"
echo "2. Ejecutar: cat github_commands.sh"
echo "3. Crear repositorio en GitHub"
echo "4. Ejecutar comandos de conexión"
echo "5. Verificar repositorio en GitHub"
echo "6. ¡Listo para presentar!"
echo ""

print_step "ARCHIVOS DE DOCUMENTACIÓN CREADOS:"
echo "- GITHUB_SETUP_PLAN.md     (Plan original)"
echo "- DATA_SETUP.md            (Instrucciones de datos)"
echo "- PRESENTATION.md          (Resumen para clase)"
echo "- github_commands.sh       (Comandos para GitHub)"
echo ""

print_warning "RECUERDA: Ejecuta 'cat github_commands.sh' para ver los comandos de GitHub"
echo ""

print_success "¡Tu proyecto Neural News Analysis está listo para GitHub! 🚀"
