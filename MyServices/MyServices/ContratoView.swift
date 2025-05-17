//
//  ContratoView.swift
//  MyServices
//
//  Created by Turma02-23 on 13/03/25.
//

import SwiftUI

struct ContratoView: View {
    @State private var date = Date.now
    @Binding var profissionalSelecionado : Profissional
    @StateObject var vm : ModelView
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.fundo.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Contratação")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                Spacer()
                VStack {
                    VStack {
                        Text(profissionalSelecionado.nome)
                            .font(.title)
                        Text(profissionalSelecionado.profissao)
                            .font(.headline)
                        Text(profissionalSelecionado.telefone)
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Digite a data da contratação:")
                            DatePicker("Digite a data", selection: $date)
                                            .datePickerStyle(GraphicalDatePickerStyle())
                                          
                        }
                        .padding()
                        Spacer()
                    }
                }
                .background(.botaoCategoria)
                .cornerRadius(10)
                .padding()
                .padding(.bottom, 10)
                Spacer()
                Button ("Enviar") {
                    // implementar funcao pra mandar pro historico
                    let novoHist = Historico(id: profissionalSelecionado._id, datahora: "\(date.timeIntervalSince1970)", preco: Double.random(in: 10...100), avaliacao: 0.0, comentario: "")
                    vm.arrayPerfis[0].historico.append(novoHist)
                    // vm post perfis
                    
                    dismiss()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .cornerRadius(10)
                Spacer()
            }
            .padding()
        }
    }
}

//#Preview {
//    ContratoView()
//}
