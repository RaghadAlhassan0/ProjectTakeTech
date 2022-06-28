//
//  ListOfCards.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 15/11/1443 AH.
//
import SwiftUI

struct ListOfCards: View {
    
    @State var searchtext = ""
    @State var isSearching = false
    
    let majors: [User] = cardmodel.samples
    
    @EnvironmentObject var firebaseManager: FireBaseManager
    @Environment(\.presentationMode) var presentationMode
    @State var isShowingOnboardingView: Bool = false
    @State var isShowingCardDetailView: Bool = false
    @State var isShowingNoAccountWarning: Bool = false
    @State var isShowingRegistrationView: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color.init("background").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        HStack{
                            TextField("Search...", text: $searchtext)
                                .padding(.horizontal, 40)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(Color(.systemGray5))
                        .cornerRadius(4)
                        .padding(.horizontal, 16.0)
                        .padding(.vertical , 8)
                        .onTapGesture(perform: {
                            isSearching = true
                        })
                        .overlay(HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            Spacer()
                            
                            if isSearching {
                                
                                Button (action: {
                                    searchtext = ""
                                }, label: { Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .foregroundColor(.white)
                                })
                            }
                        }.padding(.horizontal , 24))
                        Spacer()
                        
                        
                        ForEach(firebaseManager.consultants, id:\.self){ consultant in
                            ConsultationCell(consultant: consultant,
                                             isShowingCardDetailView: $isShowingCardDetailView,
                                             selectedConsultant: $firebaseManager.selectedConsultant)
                            .onTapGesture{
                                firebaseManager.selectedConsultant = consultant
                                isShowingCardDetailView.toggle()
                            }
                        }
                    }
                }
                
            }
            
            
            .navigationTitle("Consultations")
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if !firebaseManager.hasSeenOnboardingView {
                    isShowingOnboardingView.toggle()
                }
            }
        }
        
        .fullScreenCover(isPresented: $isShowingCardDetailView, content: {
            CardDetails(consultant: firebaseManager.selectedConsultant,
                        isShowingNoAccountWarning: $isShowingNoAccountWarning,
                        isShowingRegistrationView: $isShowingRegistrationView)
        })
        
        .fullScreenCover(isPresented: $isShowingRegistrationView, content: {
            NavigationView{
                SignUp()
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isShowingRegistrationView.toggle()
                            } label: {
                                Text("Dimiss")
                            }

                        }
                    }
            }
        })
        
        
        .fullScreenCover(isPresented: $isShowingOnboardingView, onDismiss: showRegistrationView){
            FirstPage(isShowingRegistrationView: $isShowingRegistrationView)
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
    func showRegistrationView() {
        if firebaseManager.isConsultant {
            isShowingRegistrationView = true
        }
    }
}

struct searchBarview_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(FireBaseManager())
            .preferredColorScheme(.dark)
        
    }
}
