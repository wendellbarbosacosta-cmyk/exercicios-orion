// 1. Atualizar (Update): Adiciona um array de 'comentarios' ao post sobre NoSQL
db.posts.updateOne(
  { titulo: "Bancos de Dados NoSQL" },
  { $set: { 
      comentarios: [
        { usuario: "Danilo", texto: "Muito bom, ajudou muito!" },
        { usuario: "Maria", texto: "Excelente explicação sobre flexibilidade." }
      ] 
    } 
  }
);

// 2. Consultar (Read): Retorna apenas posts que contêm a tag "nosql" dentro do array de tags
db.posts.find({ tags: "nosql" });

// 3. Consultar (Read): Retorna apenas posts onde o autor seja "Wendell Costa"
db.posts.find({ autor: "Wendell Costa" });