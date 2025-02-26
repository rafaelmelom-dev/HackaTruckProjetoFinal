//
//  ContentView.swift
//  ProjetoFinal
//
//  Created by Turma02-23 on 25/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       // NavigationStack {
            TabView {
                Home()
                    .tabItem {
                        Label("Início", systemImage: "house")
                    }
                
                Busca()
                    .tabItem {
                        Label("Busca",
                              systemImage: "magnifyingglass")
                    }
                
                Historico()
                    .tabItem {
                        Label("Histórico",
                              systemImage: "list.bullet.rectangle.portrait")
                    }
                
                Perfil()
                    .tabItem {
                        Label("Perfil",
                              systemImage: "person.circle.fill")
                    }
            
            }
       // }
    }
}

#Preview {
    ContentView()
}
