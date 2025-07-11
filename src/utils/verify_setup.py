#!/usr/bin/env python3
"""
Script de verificación para confirmar que todas las librerías están instaladas correctamente
"""

import sys


def verify_installation():
    """Verifica que todas las librerías necesarias estén instaladas"""
    print("🔍 Verificando instalación de librerías...\n")

    # Lista de librerías a verificar
    libraries = {
        "pandas": "pd",
        "numpy": "np",
        "matplotlib.pyplot": "plt",
        "seaborn": "sns",
        "tensorflow": "tf",
        "sklearn": "sklearn",
        "xgboost": "xgb",
        "gensim": "gensim",
        "nltk": "nltk",
        "wordcloud": "wordcloud",
        "gdown": "gdown",
    }

    failed_imports = []

    for lib_name, alias in libraries.items():
        try:
            exec(f"import {lib_name} as {alias}")

            # Obtener versión si está disponible
            try:
                version = eval(f"{alias}.__version__")
                print(f"✅ {lib_name}: {version}")
            except AttributeError:
                print(f"✅ {lib_name}: importado correctamente")

        except ImportError as e:
            print(f"❌ {lib_name}: ERROR - {e}")
            failed_imports.append(lib_name)

    print("\n" + "=" * 50)

    if failed_imports:
        print(f"❌ FALLÓ LA VERIFICACIÓN")
        print(f"Librerías faltantes: {', '.join(failed_imports)}")
        print("Ejecuta los comandos de instalación del plan de resolución.")
        return False
    else:
        print("🎉 ¡TODAS LAS LIBRERÍAS INSTALADAS CORRECTAMENTE!")
        print("El entorno está listo para el proyecto de redes neuronales.")
        return True


def check_python_version():
    """Verifica la versión de Python"""
    print(f"🐍 Python: {sys.version}")
    major, minor = sys.version_info[:2]

    if major == 3 and minor >= 9:
        print("✅ Versión de Python compatible")
        return True
    else:
        print("❌ Se requiere Python 3.9 o superior")
        return False


if __name__ == "__main__":
    print("=" * 60)
    print("🔧 VERIFICACIÓN DEL ENTORNO - NEURAL NEWS PROJECT")
    print("=" * 60)
    print()

    # Verificar Python
    python_ok = check_python_version()
    print()

    # Verificar librerías
    libs_ok = verify_installation()

    print("\n" + "=" * 60)
    if python_ok and libs_ok:
        print("🚀 El entorno está listo. Puedes comenzar el proyecto!")
        print("Próximo paso: Crear el notebook principal y descargar los datasets.")
    else:
        print("⚠️  Corrige los errores antes de continuar.")
    print("=" * 60)
