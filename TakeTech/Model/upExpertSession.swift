//
//  upExpertSessionView.swift
//  macro
//
//  Created by Nada on 14/11/1443 AH.
//

import SwiftUI

struct upExpertSession: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 358, height: 194)
                .foregroundColor(.init("gray"))
                .cornerRadius(6)
            VStack(alignment: .leading, spacing: 12){
                
                HStack(spacing: 10){
                    //avatar
                    Image("mohammed")
                        .resizable()
                        .frame(width: 44, height: 44, alignment: .trailing)
                        .clipShape(Circle())
                        .padding(.leading, 16.0)
                    //name
                    Text("Mohammed")
                        .font(.system(size:16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    //date
                    Text("25/07/2022    2:30pm")
                        .font(.system(size:12))
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .padding(.leading, 48.0)
                }
                
                Text("Before I spend my money and time on cybersecurity certifications, I want to find one that will give me a competitive advantage in my career    ")
                    .font(.system(size:13))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(width: 301, height: 74, alignment: .leading)
                    .padding(.leading, 27.0)
                HStack( spacing: 8){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Next")
                                .font(.system(size:15))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(width: 157, height: 30, alignment: .center)
                                .background(.foreground)
                                .foregroundColor(.init("blue"))                                .cornerRadius(6)
                        }
                        
                        Text("Cancel")
                            .font(.system(size:15))
                            .fontWeight(.medium)
                            .foregroundColor(.red)
                            .frame(width: 157, height: 30, alignment: .center)
                        
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.red)
                            )
                    }
                    
                }.padding(.leading, 8.0)
                
            }
            
        }
    }
}

struct upExpertSession_Previews: PreviewProvider {
    static var previews: some View {
        upExpertSession()
            .preferredColorScheme(.dark)
    }
}
