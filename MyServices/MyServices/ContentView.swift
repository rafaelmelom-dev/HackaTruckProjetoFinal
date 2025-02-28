//
//  ContentView.swift
//  MyServices
//
//  Created by Turma02-2 on 27/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Início", systemImage: "house")
                }
            
            BuscaView()
                .tabItem {
                    Label("Busca",
                          systemImage: "magnifyingglass")
                }
            
            HistoricoView()
                .tabItem {
                    Label("Histórico",
                          systemImage: "list.bullet.rectangle.portrait")
                }
            
            PerfilView()
                .tabItem {
                    Label("Perfil",
                          systemImage: "person.circle.fill")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
