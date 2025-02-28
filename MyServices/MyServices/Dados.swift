//
//  Dados.swift
//  ProjetoFinal
//
//  Created by Turma02-2 on 26/02/25.
//

import Foundation

struct Profissao: Identifiable {
    let id : Int
    let nome : String
    let icone : String
}


var profissoes = [
    Profissao(id: 1, nome: "Advogado", icone: "building.columns"),
    Profissao(id: 2, nome: "Arquiteto", icone: "pencil.line"),
    Profissao(id: 3, nome: "Borracheiro", icone: "digitalcrown.arrow.counterclockwise"),
    Profissao(id: 4, nome: "Barbeiro", icone: "scissors"),
    Profissao(id: 5, nome: "Carpinteiro", icone: "table.furniture"),
    Profissao(id: 6, nome: "Chaveiro", icone: "key.horizontal"),
    Profissao(id: 7, nome: "Costureira", icone: "hanger"),
    Profissao(id: 8, nome: "Eletricista", icone: "lightbulb.max"),
    Profissao(id: 9, nome: "Encanador", icone: "wrench.adjustable"),
    Profissao(id: 10, nome: "Entregador", icone: "truck.box"),
    Profissao(id: 11, nome: "Faxineiro", icone: "house"),
    Profissao(id: 12, nome: "Jardineiro", icone: "tree"),
    Profissao(id: 13, nome: "Marceneiro", icone: "chair.lounge"),
    Profissao(id: 14, nome: "Mecânico", icone: "car.side.front.open"),
    Profissao(id: 15, nome: "Operador de máquinas", icone: "gearshape.2"),
    Profissao(id: 16, nome: "Pintor", icone: "paintbrush"),
    Profissao(id: 17, nome: "Pedreiro", icone: "hammer"),
    Profissao(id: 18, nome: "Professor particular", icone: "graduationcap"),
    Profissao(id: 19, nome: "Veterinário", icone: "dog"),
    Profissao(id: 20, nome: "Técnico em Eletrodomésticos", icone: "microwave")
]

struct Profissional: Codable, Hashable{
    var nome: String
    var foto: String
    var profissao: String
    var estrelas: Double
    var telefone: String
    var contratacoes: Int
    var descricao: String
    var comentarios: [Comentario]
}

struct Comentario: Codable, Identifiable, Hashable{
    var id: String
    var comentario: String
}

struct Perfil: Codable, Hashable{
    var nome: String
    var foto: String
    var endereco: Endereco
    var favoritos: [String]
    var descricao: String
    var historico: Historico
}

struct Endereco: Codable, Hashable{
    var estado: String
    var cidade: String
    var bairro: String
    var rua: String
    var numero: Int
    var cep: Int
}

struct Historico: Codable, Identifiable, Hashable{
    var id: String
    var datahora: String
    var preco: Double
    var avaliacao: Double
}

