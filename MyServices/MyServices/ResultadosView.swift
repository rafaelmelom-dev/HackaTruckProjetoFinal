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
                .foregroundColor(.laranja)
        }
        else if valor >= Double(starIndex) - 0.9 {
            Image(systemName: "star.leadinghalf.filled")
                .foregroundColor(.laranja)
        }
        else {
            Image(systemName: "star")
                .foregroundColor(.laranja)
        }
    }
}

import SwiftUI

struct ResultadosView: View {
    
    @StateObject var vm : ModelView
    var p : [Profissional]
    
    @State var auxPro : Profissional = Profissional(_id: "", _rev: "", nome: "Edilson", foto: "https://st2.depositphotos.com/1518767/6088/i/450/depositphotos_60889523-stock-photo-plumber-smiling-at-the-camera.jpg", profissao: "Dev", estrelas: 5, telefone: "", contratacoes: 1, descricao: "", comentarios: [Comentario(id: "", comentario: "")])
    
    @State  var sheet = false
    
    var body: some View {
        
        NavigationStack{
        
            ScrollView {
                
                Text((p.first!.profissao))
                    .font(.title)
                    .bold()
                
                ForEach(p, id: \.self) { profissional in
                    
                    NavigationLink(destination: ProfissionalView(profissionalSelecionado: $auxPro, vm: vm).onAppear{auxPro = profissional}){
                        
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
                            if vm.arrayPerfis[0].favoritos.contains(profissional._id) {
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(Color.red)
                                    .onTapGesture {
                                        vm.arrayPerfis[0].favoritos.removeAll(where: { $0 == profissional._id })
                                    }
                            }else{
                                Image(systemName: "heart")
                                    .onTapGesture {
                                        vm.arrayPerfis[0].favoritos.append(profissional._id)
                                    }
                            }
                            
                        }.background(.white)
                        .padding()
                        Divider()
                    }
                }.accentColor(.black)
            }
        }
    }
}


