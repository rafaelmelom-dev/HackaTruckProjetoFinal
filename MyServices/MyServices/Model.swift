//
//  Model.swift
//  ProjetoFinal
//
//  Created by Turma02-18 on 26/02/25.
//

import Foundation

class ModelView : ObservableObject{
    
    @Published var arrayProfissionais : [Profissional] = []
    @Published var arrayPerfis : [Perfil] = []
//    @Published var favoritos: [Profissional] = []
    
    func fetchProfissionais(){
        
        let urlProfissionais = "http://192.168.128.15:1880/getprofissionais"
        
        
        let taskProfissionais = URLSession.shared.dataTask(with: URL(string: urlProfissionais)!){dados, _, error in
            do{
                self.arrayProfissionais = try JSONDecoder().decode([Profissional].self, from: dados!)
                
                
                
            }catch{
                print(error)
            }
            
        }
        
        taskProfissionais.resume()
    }
    
    
    func categories() -> [Profissao]{
        
        var cat : [Profissao] = []
        
        print( self.arrayProfissionais.count)
        
        for y in profissoes{
            
            let obj = self.arrayProfissionais.filter({ $0.profissao == y.nome})
        
            if(obj.count > 0){
                cat.append(y)
            }
            
        }
        
        return cat
        
        
    }
    
    func fetchPerfis(){
        
        let urlPerfis = "http://192.168.128.15:1880/getperfis"
        
        
        let taskPerfis = URLSession.shared.dataTask(with: URL(string: urlPerfis)!){dados, _, error in
            do{
                self.arrayPerfis = try JSONDecoder().decode([Perfil].self, from: dados!)
                print(self.arrayPerfis.count)
            }catch{
                print(error)
            }
            
        }
        taskPerfis.resume()
    }
    
    func filterProfissionaisByNome (_ nomeProfissao : String) -> [Profissional]{
        
        let arrayByProf = arrayProfissionais.filter({ $0.profissao == nomeProfissao })
        return arrayByProf
    }
    
    
}



