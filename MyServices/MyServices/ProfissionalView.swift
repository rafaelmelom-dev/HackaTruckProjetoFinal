//
//  ProfissionalView.swift
//  MyServices
//
//  Created by Turma02-18 on 27/02/25.
//

import SwiftUI

struct ProfissionalView: View {
    
    @State private var sheet: Bool = false
    @Binding var profissionalSelecionado : Profissional
    @StateObject var vm: ModelView
    
    var body: some View {
        VStack {
//            Image(systemName: "person.crop.circle.fill")
//                .font(.system(size: UIScreen.main.bounds.width * 0.3))
            Spacer()
            AsyncImage(url: URL(string: profissionalSelecionado.foto)) { image in
                image
                    .resizable()
                
                    .aspectRatio(1, contentMode: .fit)
                
                    .clipShape(Circle())
                    .frame(width: UIScreen.main.bounds.width * 0.3)
            } placeholder: {
                AsyncImage(url: URL(string: "https://w7.pngwing.com/pngs/1000/665/png-transparent-computer-icons-profile-s-free-angle-sphere-profile-cliparts-free.png")) { image in
                    image
                        .resizable()
                    
                        .aspectRatio(1, contentMode: .fit)
                    
                        .clipShape(Circle())
                        .frame(width: UIScreen.main.bounds.width * 0.3)
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
                    Button ("Contratar serviço") {
                        sheet.toggle()
                    }
                }
                .padding([.leading])
                .padding([.top, .bottom], 10)
                ScrollView {
                    // ainda está dando errado
                    ForEach(profissionalSelecionado.comentarios, id: \.self) { comentario in
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: UIScreen.main.bounds.width * 0.15))
                            VStack {
                                HStack {
                                    Text(comentario.id)
                                        .font(.headline)
                                    Spacer()
                                }
                                HStack {
                                    Text(comentario.comentario)
                                    Spacer()
                                }
                            }
                        }
                        .padding()
                        .border(.black)
                    }
                }.sheet(isPresented: $sheet) {
                    ContratoView(profissionalSelecionado: $profissionalSelecionado, vm: vm)
                }
            }
        }
    }
}

//#Preview {
//    ProfissionalView()
//}
