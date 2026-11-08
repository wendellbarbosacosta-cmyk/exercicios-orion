# 1. Imagem base leve 
# O "alpine" é uma versão minúscula do Linux.
FROM python:3.11-alpine

# 2. Configurando o WORKDIR
WORKDIR /app

# 3. Copia apenas o arquivo de requisitos primeiro
COPY requirements.txt .

# 4. Instala as dependências com o --no-cache-dir ajudando a manter a imagem mais leve
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copia o resto do código da aplicação
COPY . .

# 6. Definindo o comando de execução. 
# forçando a API a rodar na porta 3000.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]