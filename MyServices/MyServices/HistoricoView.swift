//
//  Historico.swift
//  ProjetoFinal
//
//  Created by Turma02-23 on 25/02/25.
//

import SwiftUI

struct HistoricoView : View {
    @State var aberto : Bool = false
    @State var aval_aberto : Bool = false
    @State var coment : String = ""
    @State var aval : Double = 0.0
    @StateObject var vm: ModelView
    @State var auxPro : Profissional = Profissional(_id: "", _rev: "", nome: "Edilson", foto: "https://st2.depositphotos.com/1518767/6088/i/450/depositphotos_60889523-stock-photo-plumber-smiling-at-the-camera.jpg", profissao: "Dev", estrelas: 5, telefone: "", contratacoes: 1, descricao: "", comentarios: [Comentario(id: "", comentario: "")])
//    [
//        Historico(id: "796d431d82f1257c01cd61433ad7c1f3", datahora: "14/03", preco: 84.2, avaliacao: 4.2, comentario: "Serviço muito bom!"),
//        Historico(id: "796d431d82f1257c01cd61433ad7e567", datahora: "13/03", preco: 67.0, avaliacao: 5, comentario: "Excelente!")
//    ]
    
    var body: some View {
        ZStack {
            Color.fundo.ignoresSafeArea()
            VStack {
                HStack {
                    Text("Histórico")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding()
                ScrollView {
                    VStack {
                        let profissionais_hist = vm.arrayProfissionais.filter { profissional in
                            vm.arrayPerfis[0].historico.filter { hist in
                                hist.id == profissional._id
                            }.count > 0
                        }
                        ForEach(profissionais_hist, id: \.self) { profissional in
                            let hist = vm.arrayPerfis[0].historico.filter {
                                $0.id == profissional._id
                            }[0]
                            VStack {
                                HStack {
                                    //                                                            Image(systemName: "person.crop.circle.fill")
                                    //                                                                .font(.system(size: UIScreen.main.bounds.width * 0.2))
                                    //                                                                .padding(.trailing, 15)
                                    AsyncImage(url: URL(string: profissional.foto)) { image in
                                        image
                                            .resizable()
                                        
                                            .aspectRatio(1, contentMode: .fit)
                                        
                                            .clipShape(Circle())
                                            .frame(width: 70, height: .infinity)
                                    } placeholder: {
                                        AsyncImage(url: URL(string: "https://w7.pngwing.com/pngs/1000/665/png-transparent-computer-icons-profile-s-free-angle-sphere-profile-cliparts-free.png")) { image in
                                            image
                                                .resizable()
                                            
                                                .aspectRatio(1, contentMode: .fit)
                                            
                                                .clipShape(Circle())
                                                .frame(width: 70, height: .infinity)
                                        } placeholder: {
                                            
                                            Color.gray
                                        }
                                    }
                                    VStack {
                                        Text(profissional.nome)
                                            .font(.title2)
                                            .frame(maxWidth: UIScreen.main.bounds.width * 0.3,alignment: .leading)
                                        Text(profissional.profissao)
                                            .font(.headline)
                                            .frame(maxWidth: UIScreen.main.bounds.width * 0.3,alignment: .leading)
                                        Text("Data: " + (hist.datahora ?? "Indisponível"))
                                            .frame(maxWidth: UIScreen.main.bounds.width * 0.3,alignment: .leading)
                                        Text("Preço: \(String(format: "%.2f", hist.preco ?? 0.0))")

                                            .frame(maxWidth: UIScreen.main.bounds.width * 0.3,alignment: .leading)
                                        
                                    }
                                    .padding(.trailing, 60)
                                }
                                HStack {
                                    Text("Sua avaliação: ")
                                    Text("Avaliação: \(String(format: "%.2f", hist.avaliacao ?? 0.0))")

                                    HStack {
                                        estrela(valor: hist.avaliacao ?? 0.0)
                                    }
                                }
                                .padding(.top, 10)
                                HStack {
                                    Text("Seu comentário: ")
                                    Text(hist.comentario ?? "Indisponível")
                                    
                                }
                                Button ("Avaliar") {
                                    auxPro = profissional
                                    aval_aberto.toggle()
                                }
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding()
                            }
                            .padding()
                            .background(.botaoCategoria)
                            .cornerRadius(10)
                            .onTapGesture {
                                auxPro = profissional
                                aberto.toggle()
                            }
                        }
                    }
                    .sheet(isPresented: $aberto) {
                        ProfissionalView(profissionalSelecionado: $auxPro, vm: vm)
                    }
                    .sheet(isPresented: $aval_aberto) {
                        AvaliacaoView(coment: $coment, aval: $aval, profissionalSelecionado: $auxPro, vm: vm)
                    }
                }
                //.onAppear(){vm.fetchProfissionais(); vm.fetchPerfis()}
            }
        }
    }
}

