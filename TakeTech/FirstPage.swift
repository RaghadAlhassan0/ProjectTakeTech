//
//  FirstPage.swift
//  TakeTechSH
//
//  Created by Shahad Alkamli on 31/05/2022.
//



import SwiftUI

struct FirstPage: View {
    var body: some View {
        
        
        VStack{
            
            Spacer()
            
            Text("TakeTech")
                .font(.largeTitle)
            
            
            Spacer()
            
            
            Button{
                
            } label:{
                Text("I need a consultant")
                
                    .frame(width: 250, height: 25)
                
            }
            
            .buttonStyle(.bordered)
            .foregroundColor(.black)
            .background(Color("blue"))
            .cornerRadius(4)
            
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            
            Button{
                
            } label:{
                Text("I'm a consultant")
                
                    .frame(width: 250, height: 25)
                
                
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(.black)
            .border(Color.white)
            .cornerRadius(4)
            
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            Spacer()
            
            
        }
        
        
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
        
            .preferredColorScheme(.dark)
        
    }
}



