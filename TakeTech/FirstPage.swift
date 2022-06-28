//
//  FirstPage.swift
//  TakeTechSH
//
//  Created by Shahad Alkamli on 31/05/2022.
//



import SwiftUI

struct FirstPage: View {
    @EnvironmentObject var firebaseManager: FireBaseManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowingRegistrationView: Bool
    var body: some View {
        NavigationView{
            ZStack{
                Color("background").ignoresSafeArea()
                VStack{
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                    Spacer()
                    Button (action: {
                        firebaseManager.isConsultant = false
                        firebaseManager.hasSeenOnboardingView = true
                        presentationMode.wrappedValue.dismiss()
                    } ){
                        
                        Text("I need a consultant")
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(width: 250, height: 15)
                            .padding(.all)
                            .background(Color("blue"))
                    }.cornerRadius(4)
                    
                    
                    Button (action: {
                        firebaseManager.isConsultant = true
                        firebaseManager.hasSeenOnboardingView = true
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            firebaseManager.isShowingRegistrationView = true
                        }
                    }){
                        Text("I'm a consultant")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 15)
                            .padding(.all)
                    }
                    .background(RoundedRectangle(cornerRadius: 4.0).stroke(Color.white))
                    .padding([.top, .horizontal])
                    Spacer()
                    
                }
            }
        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage(isShowingRegistrationView: .constant(false))
            .preferredColorScheme(.dark)
        
    }
}



