//
//  confirmView.swift
//  macro
//
//  Created by Nada on 17/11/1443 AH.
//

import SwiftUI

struct SingUpConfirmedView: View {
    var body: some View {
        
        ZStack{
            Color.init("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 98, height: 98, alignment: .center)
                    .foregroundColor(Color("MyYellow"))
                    .font(Font.title.weight(.ultraLight))
                
                Text("Your request was successfully                                                                submitted! ")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                    .frame(width: 330, height:70, alignment: .leading)
                
                Text("Our admins will send you an email once they review your request!                                                                Please be noted that your request may take up to 2 weeks maximum until it is fully completed")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                    .font(.system(size:18))
                    .frame(width: 330, height:120, alignment: .leading)
                    .padding(.bottom, 200.0)
                    .padding()
                Button (action: {} ){
                    //
                    Text("Done")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(width: 250, height: 15)
                        .padding(.all)
                }
                .background(.foreground)
                .foregroundColor(.init("blue"))
                .cornerRadius(6)
                .padding()
            }
        }
        
    }
}

struct confirmView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpConfirmedView()
            .preferredColorScheme(.dark)
    }
}
