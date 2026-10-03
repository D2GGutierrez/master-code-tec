# admin-api

Backend del panel docente: cursos, problemas, evaluaciones, y registro e inicio de sesión de todos los usuarios. Emite los JWT. Usa `admin_schema`.

- Tecnología: Django + Django REST Framework
- Responsable: Juan Diego
- Puerto: 8000

## Requisitos

- Python 3.12 o superior.
- La base levantada desde la raíz del monorepo: `docker compose up -d db`.
- El archivo `.env` en la raíz del monorepo (copia de `.env.example` con tus valores).

## Comandos (Windows, PowerShell, desde `admin-api/`)

```powershell
py -m venv .venv                                                  # crear el entorno virtual
.venv\Scripts\python.exe -m pip install -r requirements-dev.txt   # instalar dependencias
.venv\Scripts\ruff.exe check                                      # revisar el estilo
.venv\Scripts\python.exe manage.py test                           # pruebas (no necesitan base de datos)
.venv\Scripts\python.exe manage.py migrate                        # crear las tablas en admin_schema
.venv\Scripts\python.exe manage.py runserver                      # http://localhost:8000/health
docker build -t master-code-admin-api .                           # construir la imagen
```

En Linux/Mac es igual, cambiando `.venv\Scripts\python.exe` por `.venv/bin/python` (y `py` por `python3`).
