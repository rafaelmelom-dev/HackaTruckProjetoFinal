//
//  LoginView.swift
//  MyServices
//
//  Created by Turma02-2 on 11/03/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = ModelView()
    @State private var sheet = false
    @State private var login: String = ""
    @State private var senha: String = ""
    
    @State var logado = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.fundo.ignoresSafeArea()
                VStack{
                    VStack{
                        Image("myservices")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .padding(0)
                        Text("O seu aplicativo de serviços gerais")
                            .padding()
                            .foregroundStyle(Color.black)
                            .frame(width: 300, height: 40)
                            .background(.laranja.opacity(0.8))
                            .cornerRadius(30)
                            .padding(.bottom)
                    }
                    
                    VStack(alignment: .center, spacing: 40){
                        
//                        ForEach(vm.arrayPerfis, id: \.self) { p in
//                            Text(p.nome)
//                        }
                        
                        VStack(spacing: 20){
                            VStack(alignment: .leading){
                                RoundedRectangle(
                                    cornerRadius: 10,
                                    style: .continuous
                                )
                                .stroke(.black.opacity(0.3), lineWidth: 1)
                                .fill(.white)
                                .frame(width: .infinity, height: 70)
                                .overlay {
                                    VStack(alignment: .leading, spacing: 0){
                                        
                                        Text("Login")
                                            .font(.system(size: 20))
                                            .bold()
                                            .foregroundStyle(Color.black.opacity(0.7))
                                            .frame(width: 70, height: 30)
                                            .cornerRadius(5)
                                        TextField(text: $login, prompt: Text("Digite seu login")) {
                                            Text("Username")
                                        }
                                        .autocapitalization(.none)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 5)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            VStack(alignment: .leading){
                                RoundedRectangle(
                                    cornerRadius: 10,
                                    style: .continuous
                                )
                                .stroke(.black.opacity(0.3), lineWidth: 1)
                                .fill(.white)
                                .frame(width: .infinity, height: 70)
                                .overlay {
                                    VStack(alignment: .leading, spacing: 0){
                                        Text("Senha")
                                            .font(.system(size: 20))
                                            .bold()
                                            .foregroundStyle(Color.black.opacity(0.7))
                                            .frame(width: 70, height: 30)
                                            .cornerRadius(5)
                                        SecureField(text: $senha, prompt: Text("Digite sua senha")) {
                                            Text("Senha")
                                        }.padding(.vertical, 5)
                                            .padding(.horizontal, 5)
                                    }
                                }
                            }
                        }
                        
                        
                        
                        
                       
                        
                        
//                        // Button user taps to set the `ball`,
//                        // triggering the BallView to be shown.
                        
                        NavigationLink(
                            destination: ContentView(vm: vm).navigationBarBackButtonHidden(true),
                            isActive: $logado,
                            label: {
                                EmptyView()
                            }
                        )
                        
                        VStack{
                            Button {
                                let a = vm.arrayPerfis.filter({
                                    $0.login == login && $0.senha == senha
                                })
                                
                                if(a.count > 0){
                                    logado = true
                                    vm.arrayPerfis = a
                                }
                                
                                
                                
                            } label: {
                                Text("Entrar")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 10,
                                            style: .continuous
                                        )
                                        .fill(.blue.opacity(0.9))
                                        .frame(width: 280, height: 50)
                                    )
                            }

                            VStack{
                                Text("Não tem uma conta?")
                                    .foregroundColor(.black)
                                
                                Button {
                                    sheet.toggle()
                                } label: {
                                    Text("Criar uma conta")
                                        .foregroundColor(.blue)
                                }.sheet(isPresented: $sheet){
                                    CadastroView(vm: vm)
                                }
                            }.padding()
                        }
                        
                    }.padding()
                        .frame(maxWidth: .infinity, maxHeight: 600)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    
                }.onAppear(){
                    vm.fetchPerfis()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
