
// Select the database to use.
use('dbLAB');

//Crie uma coleção Livros
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

db.software.aggregate(
    {$match: {"fabricante_cnpj": {$exists: true} }},
      {$lookup: 
        { from: "empresa",
          localField : "fabricante_cnpj"
          foreignField : "cnpj",
          as : "fabricante_software" } }, 
      {$project : {_id:0, nome: 1 , versao : 1 , "fabricante_software.razao_social" : 1 , 
       "fabricante_software.fones" : 1 }})

       db.livro.aggregate(
        {$match: {"autor": {$exists: true} }},
        {$lookup:
            {   from: "autor",
                localField:"autor",
                foreignField:"id",
                as:"autor"
            }
        }
    )db.livro.aggregate(
    {$match: {"autor": {$exists: true} }},
    {$lookup:
        {   from: "autor",
            localField:"autor",
            foreignField:"id",
            as:"autor"
        }
    }
)
