from fastapi import FastAPI
import psycopg2
import os

app = FastAPI()

# Função para conectar no banco usando as variáveis de ambiente
def get_db_connection():
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASS")
    )
    return conn

@app.get("/")
def read_root():
    return {"status": "ok", "mensagem": "API rodando e pronta para conectar no Banco!"}

@app.get("/gravar")
def gravar_dado():
    try:
        # Conecta, cria a tabela (se não existir) e insere um dado
        conn = get_db_connection()
        cur = conn.cursor()
        
        cur.execute('CREATE TABLE IF NOT EXISTS campistas (id serial PRIMARY KEY, nome varchar (150) NOT NULL);')
        cur.execute('INSERT INTO campistas (nome) VALUES (%s)', ('Wendell Barbosa Costa - Orion Bootcamp',))
        
        conn.commit()
        cur.close()
        conn.close()
        
        return {"mensagem": "Dado gravado com sucesso no PostgreSQL!"}
    except Exception as e:
        return {"erro": str(e)}