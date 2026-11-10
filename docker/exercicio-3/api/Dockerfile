# ==========================================
# 1. ESTÁGIO BASE
# ==========================================
FROM python:3.11-alpine AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ==========================================
# 2. ESTÁGIO DE DESENVOLVIMENTO
# ==========================================
FROM base AS dev
# Adicionado a flag "--reload" no Uvicorn. Se alterar o main.py, a API irá reiniciar sozinha.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000", "--reload"]

# ==========================================
# 3. ESTÁGIO DE PRODUÇÃO
# ==========================================
FROM base AS prod
COPY . .
# Sem a flag "--reload" para máxima performance e segurança.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]