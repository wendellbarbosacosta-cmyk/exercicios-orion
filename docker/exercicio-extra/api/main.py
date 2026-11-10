from fastapi import FastAPI
import psycopg2
import os

app = FastAPI()

def get_db_connection():
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASS")
    )
    return conn

# 1. Rota de Healthcheck
@app.get("/health")
def health_check():
    return {"status": "ok"}

# 2. Rota Principal
@app.get("/")
def read_root():
    return {"mensagem": "API do Desafio Extra rodando perfeitamente!"}

# 3. Rota para gravar dados
@app.get("/gravar")
def gravar_dado():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        cur.execute('CREATE TABLE IF NOT EXISTS campistas (id serial PRIMARY KEY, nome varchar (150) NOT NULL);')
        cur.execute('INSERT INTO campistas (nome) VALUES (%s)', ('Wendell Barbosa Costa - Desafio Extra',))
        
        conn.commit()
        cur.close()
        conn.close()
        
        return {"mensagem": "Dado gravado! Abra o pgAdmin para conferir a tabela."}
    except Exception as e:
        return {"erro": str(e)}