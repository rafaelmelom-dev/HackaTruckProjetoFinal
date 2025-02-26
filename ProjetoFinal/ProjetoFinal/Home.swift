//
//  Home.swift
//  ProjetoFinal
//
//  Created by Turma02-23 on 25/02/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("MyServices")
                    .font(.title)
                Spacer()
            }
            Spacer()
            HStack {
                Text("Serviços mais bem avaliados")
                    .font(.headline)
                Spacer()
            }
            .padding()
            VStack {
                HStack {
                    VStack {
                        Circle()
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.3)
                    }
                    VStack {
                        VStack {
                            Text("Caio encanador")
                        }
                        VStack {
                            Text("5 Estrelas")
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    Home()
}
