//
//  ContratoView.swift
//  MyServices
//
//  Created by Turma02-23 on 11/03/25.
//

import SwiftUI

struct AvaliacaoView: View {
    @Binding var coment : String
    @Binding var aval : Double
    @Binding var profissionalSelecionado : Profissional
    @StateObject var vm : ModelView
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.fundo.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Avaliação")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                Spacer()
                VStack {
                    AsyncImage(url: URL(string: profissionalSelecionado.foto)) { image in
                        image
                            .resizable()
                        
                            .aspectRatio(1, contentMode: .fit)
                        
                            .clipShape(Circle())
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.3)
                    } placeholder: {
                        AsyncImage(url: URL(string: "https://w7.pngwing.com/pngs/1000/665/png-transparent-computer-icons-profile-s-free-angle-sphere-profile-cliparts-free.png")) { image in
                            image
                                .resizable()
                            
                                .aspectRatio(1, contentMode: .fit)
                            
                                .clipShape(Circle())
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.3)
                        } placeholder: {
                            
                            Color.gray
                        }
                    }
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
                            Text("Digite a avaliação:")
                            TextField("Insira a avaliacao", value: $aval, format: .number)
                                .keyboardType(.decimalPad)
                                .textContentType(.oneTimeCode)
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .padding()
                        }
                        .padding()
                        Spacer()
                    }
                    HStack {
                        ForEach (1...5, id: \.self) { starIndex in
                            if aval >= Double(starIndex) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        aval = Double(starIndex)
                                    }
                            }
                            else if aval >= Double(starIndex) - 0.9 {
                                Image(systemName: "star.leadinghalf.filled")
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        aval = Double(starIndex)
                                    }
                            }
                            else {
                                Image(systemName: "star")
                                    .onTapGesture {
                                        aval = Double(starIndex)
                                    }
                            }
                        }
                    }
                    VStack {
                        Spacer()
                        Text("Digite um comentário: ")
                        TextField("Digite algo", text: $coment, axis: .vertical)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .padding()
                            .lineLimit(4...7)
                            
                        Spacer()
                    }
                    Spacer()
                }
                .background(.botaoCategoria)
                .cornerRadius(10)
                .padding()
                .padding(.bottom, 10)
                Spacer()
                Button ("Enviar") {
                    if aval > 5 {
                        aval = 5
                    } else if aval < 0 {
                        aval = 0
                    }
                    
                    // implementar funcao pra mandar avalicação para o banco
                    for i in 0..<vm.arrayProfissionais.count {
                        if vm.arrayProfissionais[i]._id == profissionalSelecionado._id {
                            vm.arrayProfissionais[i].estrelas = (vm.arrayProfissionais[i].estrelas + aval)/2
                        }
                    }
                    
                    // vm post profissionais
                    
                    dismiss()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

//#Preview {
//    AvaliacaoView()
//}
