//
//  CardFav.swift
//  MyServices
//
//  Created by Turma02-27 on 11/03/25.
//

import SwiftUI

struct CardFav: View {
    var icone : String
    var text : String
    var sub : String
    
    var body: some View {
        HStack{
            Image(systemName: icone)
                .font(.system(size: 20))
                .foregroundColor(.black)
            
            VStack(alignment: .leading){
                Text(text)
                    .foregroundColor(.black)
                Text(sub)
                    .foregroundStyle(.laranja)
            }
            
            Spacer()
            Image(systemName: "chevron.right")
            
        }
        .padding(.vertical, 5)
        .cornerRadius(10)
    }
}

#Preview {
    CardFav(icone: "globe", text: "vai", sub: "agora")
}
