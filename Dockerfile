# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de requerimientos y luego el resto del código
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Expone el puerto que usará la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["gunicorn", "-b", "0.0.0.0:8080", "api_color:app"]  # Cambia "api_color:app" si tu aplicación tiene otro nombre