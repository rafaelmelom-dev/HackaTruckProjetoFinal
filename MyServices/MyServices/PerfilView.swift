//
//  PerfilView.swift
//  MyServices
//
//  Created by Turma02-2 on 27/02/25.
//

import SwiftUI

struct PerfilView: View {
    @StateObject var vm: ModelView

    var body: some View {
        NavigationStack{
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    
                    
                    HStack(alignment: .center, spacing: 15) {
                        Spacer()
                        
                        AsyncImage(url: URL(string: vm.arrayPerfis[0].foto)) { image in
                            image
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                        } placeholder: {
                            Color.gray.frame(width: 150, height: 150)
                        }.padding(.bottom, 20)
                        
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(vm.arrayPerfis[0].nome)
                                .font(.system(size: 16)).fontWeight(.bold)
                            
                            Text(vm.arrayPerfis[0].telefone)
                                .font(.system(size: 16))
                            
                            VStack(alignment: .leading, spacing: 5){
                                Text(vm.arrayPerfis[0].endereco.estado)
                                    .font(.system(size: 16))
                                Text(vm.arrayPerfis[0].endereco.cidade)
                                    .font(.system(size: 16))
                            }
                            
                        }
                        Spacer()
                    }
                    .padding(.top, 55)
                    .edgesIgnoringSafeArea(.top)
                        .background(.gray)
                        .cornerRadius(30)
                        .padding(30)
                    
                    
                    VStack{
                      
                        
                        
                        NavigationLink(destination: FavoritosView(vm: vm), label: {
                            CardFav(icone: "heart", text: "Favoritos", sub: "Meus profissionais favoritos")
                        })
                        
                        NavigationLink(destination: FavoritosView(vm: vm), label: {
                            CardFav(icone:"questionmark.circle", text: "Ajuda", sub: "Ajuda")
                        })
                        NavigationLink(destination: FavoritosView(vm: vm), label: {
                            CardFav(icone: "gearshape", text: "Configurações", sub: "Settings")
                        })
                        NavigationLink(destination: FavoritosView(vm: vm), label: {
                            CardFav(icone: "arrow.backward.circle", text: "Sobre", sub: "Sobre o app")
                        })
                                                
                    }.padding(.horizontal, 10)
                    
                }.padding(.top, -80)
                Spacer()
            }
        }.navigationTitle("Perfil")
        
    }
}

