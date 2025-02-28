//
//  HomeView.swift
//  MyServices
//
//  Created by Turma02-2 on 27/02/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = ModelView()
    
    @State var auxPro : Profissional = Profissional(nome: "Edilson", foto: "https://st2.depositphotos.com/1518767/6088/i/450/depositphotos_60889523-stock-photo-plumber-smiling-at-the-camera.jpg", profissao: "Dev", estrelas: 5, telefone: "", contratacoes: 1, descricao: "", comentarios: [Comentario(id: "", comentario: "")])
    
    @State  var sheet = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.fundo.ignoresSafeArea()
                VStack{
                    
//                    VStack{
//                        
//                        Image("myservices")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 200)
//                            .padding(0)
//                        Text("O seu aplicativo de serviços gerais")
//                            .padding(.bottom)
//                    }.frame(width: 400).background(.fundoHome)
                    
                    Text("Melhores profissionais classificados")
                        .font(.system(size: 20))
                        .bold()
                    
                    ScrollView {
                        
                        VStack{
                            ForEach(vm.arrayProfissionais, id: \.self) { profissional in
                                
                                
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
                                    
                                }.background(.white).onTapGesture {
                                    auxPro = profissional
                                    sheet.toggle()
                                }
                                .padding()
                                Divider()
                            }.sheet(isPresented: $sheet){
                                ProfissionalView(profissionalSelecionado: $auxPro)
                            }
                        }.padding()
                    }
                }
            }
        }.onAppear(){vm.fetchProfissionais()}
    }
}


#Preview {
    HomeView()
}
