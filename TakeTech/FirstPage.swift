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
            
            

            Button (action: {} ){

                Text("I need a consultant")
                    .foregroundColor(.black)
                    .frame(width: 250, height: 15)                    .padding(.all)
            }
            
            .background(Color("blue"))
            .cornerRadius(4)

              
            

            Button (action: {} ){

                Text("I'm a consultant")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 15)
                    .padding(.all)
            }
            
            .background(RoundedRectangle(cornerRadius: 4.0).stroke(Color.white))

            
            
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



