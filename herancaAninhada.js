// Select the database to use.
use('dbLAB');

//Crie duas coleções Livros
db.livro.insertMany([
    {   id:1,
        titulo:"Memoria postumas de Bras Cubas",
        autor:1,
        ano:"1881"
    },
    { 
        id:2,
        titulo:"Grande Sertao Veredas",
        autor:2,
        ano:"1956"}
    ])
//Crie duas coleções Autores
db.autor.insertMany([
    {
        id:1,
        nome:"Machado de Assis"
    },
    {
        id:2,
        nome:"Joao Guimaraes Rosa"
    }
])

// Faça uma consulta agregando
// livros aos respectivos autores.
db.livro.aggregate(
    {$match: {"autor": {$exists: true} }},
        {$lookup:
            {   from: "autor",
                localField:"autor",
                foreignField:"id",
                as:"autor"
            }
        }
    )

// **********************
// Este será o resultado
// **********************
/*
[
  {
    _id: ObjectId('6650e3af258b0d633f841168'),
    id: 1,
    titulo: 'Memoria postumas de Bras Cubas',
    autor: [
      {
        _id: ObjectId('6650e3af258b0d633f84116a'),
        id: 1,
        nome: 'Machado de Assis'
      }
    ],
    ano: '1881'
  },
  {
    _id: ObjectId('6650e3af258b0d633f841169'),
    id: 2,
    titulo: 'Grande Sertao Veredas',
    autor: [
      {
        _id: ObjectId('6650e3af258b0d633f84116b'),
        id: 2,
        nome: 'Joao Guimaraes Rosa'
      }
    ],
    ano: '1956'
  }
]

*/

