//
//  ProfissionalView.swift
//  MyServices
//
//  Created by Turma02-18 on 27/02/25.
//

import SwiftUI

struct ProfissionalView: View {
    
    @Binding var profissionalSelecionado : Profissional
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: UIScreen.main.bounds.width * 0.3))
            VStack {
                Text(profissionalSelecionado.nome)
                    .font(.title)
                Text(profissionalSelecionado.profissao)
                    .font(.headline)
                Text(profissionalSelecionado.telefone)
                HStack {
                    Text("\(String(format: "%.02f", profissionalSelecionado.estrelas))")
                    estrela(valor: profissionalSelecionado.estrelas)
                }
                HStack {
                    Text("Descrição:")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding([.leading, .top])
                .padding(.bottom, 10)
                VStack {
                    Text(profissionalSelecionado.profissao)
                }
                HStack {
                    Text("Feedback")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Button ("Entrar em contato") {
                        if let url = URL(string: "https://wa.me/34988289074?text=Testing%20test"),
                        UIApplication.shared.canOpenURL(url) {
                           UIApplication.shared.open(url, options: [:])
                        }
                    }
                }
                .padding([.leading])
                .padding([.top, .bottom], 10)
                ScrollView {
//                    ForEach(p, id: \.self) { profissional in
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: UIScreen.main.bounds.width * 0.15))
                        VStack {
                            HStack {
                                Text("Marta")
                                    .font(.headline)
                                    Spacer()
                            }
                            HStack {
                                Text("O serviço não é muito bom.")
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .border(.black)
                    
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: UIScreen.main.bounds.width * 0.15))
                        VStack {
                            HStack {
                                Text("Rocha")
                                    .font(.headline)
                                    Spacer()
                            }
                            HStack {
                                Text("O serviço me agradou.")
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .border(.black)
                }
            }
        }
    }
}

//#Preview {
//    ProfissionalView()
//}
