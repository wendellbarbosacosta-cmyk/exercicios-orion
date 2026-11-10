FROM python:3.11-alpine

# Define a pasta de trabalho dentro do container
WORKDIR /app

# Copia os requisitos e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da API
COPY . .

# Expõe a porta e define o comando de execução
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]