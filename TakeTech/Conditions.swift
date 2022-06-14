//
//  Terms&Conditions .swift
//  TakeTechSH
//
//  Created by Shahad Alkamli on 31/05/2022.
//



import SwiftUI

struct Conditions : View {
    var body: some View {
        
        ZStack{
            Color.init("background").edgesIgnoringSafeArea(.all)
        VStack{
            
            
            Text("Terms and Conditions")
                .font(.largeTitle)
            
        }
            
        }
        
        
    }
    
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        Conditions()
        
            .preferredColorScheme(.dark)
        
    }
}



