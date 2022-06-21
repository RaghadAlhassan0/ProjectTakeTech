//
//  FirstPage.swift
//  TakeTechSH
//
//  Created by Shahad Alkamli on 31/05/2022.
//



import SwiftUI

struct FirstPage: View {
    var body: some View {
        
        ZStack{
            Color.init("background").edgesIgnoringSafeArea(.all)
            VStack{
                
                Spacer()
                
          Image("Logo")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    
                
                
                
                Spacer()
                
                
                
                Button (action: {} ){
                    
                    Text("I need a consultant")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(width: 250, height: 15)                    .padding(.all)
                }
                
                .background(Color("blue"))
                .cornerRadius(4)
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                
                
                
                
                Button (action: {} ){
                    
                    Text("I'm a consultant")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 15)
                        .padding(.all)
                }
                
                .background(RoundedRectangle(cornerRadius: 4.0).stroke(Color.white))
                
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                
                
                Spacer()
                
            }
        }
        
        
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
        
            .preferredColorScheme(.light)
        
    }
}



