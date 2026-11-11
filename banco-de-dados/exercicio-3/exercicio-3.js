// 1. Seleciona o banco de dados que criamos
use orion_nosql;

// 2. Insere o primeiro documento (Sem a matriz de tags)
db.posts.insertOne({
  titulo: "Introdução ao Docker",
  autor: "Wendell Costa",
  conteudo: "Revisando os conceitos de containerização do módulo anterior."
});

// 3. Testa o Schema Flexível inserindo um documento COM o campo novo 'tags'
db.posts.insertOne({
  titulo: "Bancos de Dados NoSQL",
  autor: "Wendell Costa",
  conteudo: "Descobrindo como o MongoDB lida com schemas dinâmicos.",
  tags: ["nosql", "flexivel"]
});

// 4. Consulta (Read) para listar todos os documentos da coleção
db.posts.find();