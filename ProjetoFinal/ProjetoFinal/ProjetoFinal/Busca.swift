//
//  Busca.swift
//  ProjetoFinal
//
//  Created by Turma02-23 on 25/02/25.
//

import SwiftUI

struct Busca: View {
    
    @State private var searchText = ""
    
    var searchResults: [Profissao] {
        if searchText.isEmpty {
            return profissoes
        } else {
            return profissoes.filter {
                $0.nome.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
      
        NavigationStack {
            ZStack{
                Color.fundo.ignoresSafeArea()
                Text("").navigationTitle("Profissões").foregroundColor(.white)
                ScrollView{
                    ForEach(searchResults) { p1 in
                        VStack{
                            NavigationLink(destination: Resultados(nome: p1.nome)){
                                HStack(alignment: .center){
                                    Image(systemName: p1.icone)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                        .foregroundColor(.white)
                                        .padding(.leading, 30)
                                        .padding(.trailing, 20)
                                    
                                    Text(p1.nome)
                                        .font(.title2).foregroundStyle(.white)
                                        .padding(1)
                                    
                                    
                                    Spacer()
                                    
                                }.frame(width: 320, height: 100)
                                    .background(.botaoCategorias)
                                    .cornerRadius(10)
                                    .padding(2)
                                
                            }
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText)
        
        
    }
}

#Preview {
    Busca()
}
