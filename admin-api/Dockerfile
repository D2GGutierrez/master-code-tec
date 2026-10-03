FROM python:3.12-slim

WORKDIR /app

# Se copia antes que el código para que Docker reutilice esta capa si solo cambia el código.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# Servidor de desarrollo de Django: no usar en producción.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
