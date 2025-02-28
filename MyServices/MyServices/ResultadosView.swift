//
//  ResultadosView.swift
//  MyServices
//
//  Created by Turma02-2 on 27/02/25.
//

func estrela (valor: Double) -> some View {
    ForEach (1...5, id: \.self) { starIndex in
        if valor >= Double(starIndex) {
            Image(systemName: "star.fill")
                .foregroundColor(.black)
        }
        else if valor >= Double(starIndex) - 0.9 {
            Image(systemName: "star.leadinghalf.filled")
        }
        else {
            Image(systemName: "star")
        }
    }
}

import SwiftUI

struct ResultadosView: View {
    
    var p : [Profissional]
    
    @State var auxPro : Profissional = Profissional(nome: "Edilson", foto: "https://st2.depositphotos.com/1518767/6088/i/450/depositphotos_60889523-stock-photo-plumber-smiling-at-the-camera.jpg", profissao: "Dev", estrelas: 5, telefone: "", contratacoes: 1, descricao: "", comentarios: [Comentario(id: "", comentario: "")])
    
    @State  var sheet = false
    
    var body: some View {
        
        NavigationStack{
        
            ScrollView {
                
                Text((p.first!.profissao))
                    .font(.title)
                    .bold()
                
                ForEach(p, id: \.self) { profissional in
                    
                    
                    HStack {
                        
                        //circle por trás a imagem
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
                            HStack {
                                Text(profissional.nome)
                                    .bold()
                                    .font(.system(size: 15))
                                Spacer()
                            }
                            HStack {
                                Text(profissional.profissao)
                                    .font(.system(size: 15))
                                Spacer()
                            }
                            HStack {
                                Text("\(String(format: "%.02f", profissional.estrelas))")
                                    .font(.system(size: 15))
                                estrela(valor: profissional.estrelas)
                                Spacer()
                            }
                            
                        }
                        Spacer()
                        Image(systemName: "heart")
                            .padding(.bottom)
                        
                    }.background(.white).onTapGesture {
                        auxPro = profissional
                        sheet.toggle()
                    }
                    .padding()
                    Divider()
                }.sheet(isPresented: $sheet){
                    ProfissionalView(profissionalSelecionado: $auxPro)
                }
            }
        }
    }
}

#Preview {
    ResultadosView(p: [Profissional(nome: "Edilson", foto: "https://st2.depositphotos.com/1518767/6088/i/450/depositphotos_60889523-stock-photo-plumber-smiling-at-the-camera.jpg", profissao: "Dev", estrelas: 5, telefone: "", contratacoes: 1, descricao: "", comentarios: [Comentario(id: "", comentario: "")]),
                       Profissional(nome: "Nicolly", foto: "https://img.freepik.com/fotos-gratis/jovem-construtora-segurando-uma-chave-inglesa-e-uma-fita-metrica-em-um-fundo-branco-isolado-com-espaco-de-copia_141793-34871.jpg", profissao: "Dev", estrelas: 3.5, telefone: "", contratacoes: 1, descricao: "", comentarios: [Comentario(id: "", comentario: "")])
                      ])
}

