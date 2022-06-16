//
//  PastCardView.swift
//  Feesback
//
//  Created by Raghad Alhassan on 09/11/1443 AH.
//

import SwiftUI

struct PastCard: View {
    var body: some View {
        
        
        ZStack{
            Rectangle()
            
            
                .frame(width: 358.0, height: 150.0)
                .cornerRadius(6)
                .foregroundColor(.init("gray"))
            
            
            HStack{
                
                Image("ImgKhalid")
                    .resizable()
                    .frame(width:55, height: 55)
                    .padding(.trailing, 260.0)
                
                
            }.padding(.bottom, 55.0)
            
            HStack{
                Text("Khalid Almonyr")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .fontWeight(.medium)
                
                    .padding(.trailing, 53.0)
                    .padding(.bottom,75.0)
                
                
            }
            
            
            
            VStack{
                
                HStack{
                    
                    
                    
                    Text("10 / 05 / 2022     -     02:30 PM")
                        .font(.system(size: 12, weight: .semibold, design: .default))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    
                    
                }.padding(.leading, 4.0)
                    .padding(.top, 30.0)
                
                
                
                HStack{
                    Button(action:{
                        
                    })  {
                        
                        
                        
                        Text("Book")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .frame(width: 292, height: 32, alignment: .center)
                            .font(.system(size: 15))
                            .background(.foreground)
                            .cornerRadius(6)
                            .foregroundColor(.init("blue"))
                        
                    }.padding(.top, 16.0)
                }
                
            }
        }
        
    }
    
}

struct PastCardView_Previews: PreviewProvider {
    static var previews: some View {
        PastCard()
            .preferredColorScheme(.dark)
    }
}
