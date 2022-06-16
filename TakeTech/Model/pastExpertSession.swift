//
//  pastExpertSessionView.swift
//  macro
//
//  Created by Nada on 17/11/1443 AH.
//

import SwiftUI

struct pastExpertSession: View {
    var ratings = 1
    var body: some View {
        VStack(alignment:.leading){
            ZStack{
                Rectangle()
                    .frame(width: 358, height: 78)
                    .foregroundColor(.init("gray"))
                    .cornerRadius(6)
                
                HStack( spacing: 15){
                    //avatar
                    Image("mohammed")
                        .resizable()
                        .frame(width: 44, height: 44, alignment: .leading)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 5){
                        //name
                        Text("Mohammed")
                            .font(.system(size:16))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        //rating
                        HStack( spacing:6, content:{
                            ForEach(1...5,id: \.self){i in
                                Image(systemName:"star.fill").resizable().frame(width:12, height:12).foregroundColor(self.ratings >= i ? .yellow : .gray)
                            }
                            
                        })
                        
                        
                    }
                    
                    
                }.frame(width: 300, height: 50, alignment: .leading)
            }
        }
    }
}

struct pastExpertSession_Previews: PreviewProvider {
    static var previews: some View {
        pastExpertSession()
            .preferredColorScheme(.dark)
    }
}
