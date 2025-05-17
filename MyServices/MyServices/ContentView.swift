//
//  ContentView.swift
//  MyServices
//
//  Created by Turma02-2 on 27/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ModelView()
    
    var body: some View {
        TabView {
            HomeView(vm: vm)
                .tabItem {
                    Label("Início", systemImage: "house")
                }
            
            BuscaView(vm: vm)
                .tabItem {
                    Label("Busca",
                          systemImage: "magnifyingglass")
                }
            
            HistoricoView(vm: vm)
                .tabItem {
                    Label("Histórico",
                          systemImage: "list.bullet.rectangle.portrait")
                }
            
            PerfilView(vm: vm)
                .tabItem {
                    Label("Perfil",
                          systemImage: "person.circle.fill")
                }
            
        }
    }
}
