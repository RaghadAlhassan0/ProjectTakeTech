//
//  Terms&Conditions .swift
//  TakeTechSH
//
//  Created by Shahad Alkamli on 31/05/2022.
//



import SwiftUI

struct Conditions : View {
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.init("background").edgesIgnoringSafeArea(.all)
                
                
                
                VStack{
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.top, -50.0)
                    
                    ScrollView(.vertical){
                        Text("The first party retains property rights. In the event of a violation or breach by the second party,the second party obligated to compensate the first party for psychological and material damage. The parties are also obligated to:" )
                            .frame(width: 350, height: 200, alignment: .leading)
                        
                        Text("- I, the consultant allow the application to take 20% of the total fees paid by the user.")
                        
                            .frame(width: 350, height: 50, alignment: .leading)
                        
                        Text("- I, the user has the right to be given a notice in approximate 24 hours, before the session start, for the consultant to cancel the session based on the issue provided. If the consultant failed to show on time, the user will be credit the full amount.")
                        
                            .frame(width: 350, height: 150, alignment: .leading)
                        
                        Text("- If the consultant cancled the session, the user will be credited the full amount.")
                        
                            .frame(width: 350, height: 50, alignment: .leading)
                        Text("- If the user cancelled before the beginning of the session in 24 hours, a refund will be credited. If the user cancelled within 24 hours before the beginning of the session, NO refund will be credited.")
                        
                            .frame(width: 350, height: 150, alignment: .leading)
                        
                        Spacer()
                    }
                    
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    
                }
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



