//
//  BuscaView.swift
//  MyServices
//
//  Created by Turma02-2 on 27/02/25.
//

import SwiftUI

struct BuscaView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @State private var searchText = ""
    @StateObject var vm = ModelView()
    
    var searchResults: [Profissao] {
        if searchText.isEmpty {
            return vm.categories()
        } else {
            return vm.categories().filter {
                $0.nome.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                Color.fundo.ignoresSafeArea()
                
            
                VStack{
                    HStack(){
                        Text("Profissões").bold().font(.title).padding(.horizontal)
                        Spacer()
                    }
                    
                    VStack(spacing: 20){
                        VStack(alignment: .leading){
                            RoundedRectangle(
                                cornerRadius: 10,
                                style: .continuous
                            )
                            .stroke(.black.opacity(0.3), lineWidth: 1)
                            .fill(.white)
                            .frame(width: .infinity, height: 40)
                            .overlay {
                                VStack(alignment: .leading, spacing: 0){
                                    TextField(text: $searchText, prompt: Text("Search")) {
                                        Text("Pesquisa")
                                    }
                                    .autocapitalization(.none)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 5)
                                    
                                }
                                
                            }
                            
                        }
                        .autocapitalization(.none)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(searchResults) { item in
                                    VStack(alignment: .center){
                                        NavigationLink(destination: ResultadosView(vm:vm, p: vm.filterProfissionaisByNome(item.nome))){
                                            VStack(alignment: .center){
                                                HStack(alignment: .center){
                                                    Image(systemName: item.icone)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 20)
                                                        .foregroundColor(.white)
                                                        .padding(.leading, 10)
                                                    
                                                    Text(item.nome)
                                                        .foregroundStyle(.white)
                                                        .padding(.leading, 5)
                                                    
                                                    Spacer()
                                                    
                                                }.frame(width: 150, height: 75)
                                                    .background(.botaoCategoria)
                                                    .cornerRadius(10)
                                                    .padding(1)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    
                }
            }
            
        }
        .onAppear(){
            vm.fetchProfissionais()
        }
    }
}


#Preview {
    BuscaView()
}
