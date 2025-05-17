//
//  ContentView.swift
//  Favoritos
//
//  Created by Turma02-27 on 10/03/25.
//

import SwiftUI

struct FavoritosView: View {
    
    @StateObject var vm: ModelView
    
    @State var auxPro: Profissional = Profissional(_id: "", _rev: "", nome: "Edilson", foto: "https://st2.depositphotos.com/1518767/6088/i/450/depositphotos_60889523-stock-photo-plumber-smiling-at-the-camera.jpg", profissao: "Dev", estrelas: 5, telefone: "", contratacoes: 1, descricao: "", comentarios: [Comentario(id: "", comentario: "")])
    
    @State var sheet = false
    @State var idAux: String = ""
    @State var status = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.fundo.ignoresSafeArea()
                VStack {
                    Text("Profissionais favoritados")
                        .font(.system(size: 20))
                        .bold()
                    
                    Divider()
                    ScrollView {
                        VStack {
                            ForEach(vm.arrayPerfis[0].favoritos, id: \.self) { id in
                                // Encontrando o profissional correspondente ao id
                                if let profissional = vm.arrayProfissionais.first(where: { $0._id == id }) {
                                    HStack {
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
                                        } else {
                                            Image(systemName: "heart")
                                                .onTapGesture {
                                                    vm.arrayPerfis[0].favoritos.append(profissional._id)
                                                }
                                        }
                                    }.onTapGesture {
                                        auxPro = profissional
                                        sheet.toggle()
                                    }
                                }
                            }
                            .padding()
                            Divider()
                        }
                        .sheet(isPresented: $sheet) {
                            // Passando a variável auxPro como um Binding para ProfissionalView
                            ProfissionalView(profissionalSelecionado: $auxPro, vm: vm)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear { vm.fetchProfissionais() }
    }
}
