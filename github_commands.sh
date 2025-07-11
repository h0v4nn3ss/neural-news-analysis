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
