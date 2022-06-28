//
//  SessionView2.swift
//  Feesback
//
//  Created by Raghad Alhassan on 13/11/1443 AH.
//

import SwiftUI

struct SessionView: View {
    
    @State var isUpcomming: Bool = true
    @EnvironmentObject var firebaseManager: FireBaseManager
    @State var isShowingRegistrationView: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color.init("background")
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center){
                        HStack{
                            Button(action: {
                                withAnimation { isUpcomming = true }
                                
                            }) {
                                
                                VStack{
                                    Text("Upcoming")
                                        .foregroundColor(self.isUpcomming ? .primary : Color.primary.opacity(0.7))
                                        .frame(width: nil)
                                    
                                    Capsule()
                                        .fill(self.isUpcomming ? Color.primary : Color.clear)
                                        .frame(width: 189, height:2)
                                }
                            }
                            //                          .padding(.horizontal, 50.0)
                            
                            Button(action: {
                                withAnimation {
                                    isUpcomming = false
                                }
                            }) {
                                VStack{
                                    
                                    Text("Past")
                                        .foregroundColor(!self.isUpcomming ? .primary : Color.primary.opacity(0.7))
                                    
                                    
                                    Capsule()
                                        .fill(!self.isUpcomming ? Color.primary : Color.clear)
                                        .frame(width: 189, height:2)
                                    
                                }
                            }
                        }.padding(.top, 125.0)
                        
                        ForEach(1...10, id:\.self){ num in
                            Upcoming()
                        }
                        //                        if isUpcomming {
                        //                            Upcoming().padding()
                        //                        } else {
                        //                            PastCard().padding()
                        //                        }
                    }
                }
            }.ignoresSafeArea()
                .navigationTitle("Sessions")
                .navigationBarTitleDisplayMode(.inline)
        }

        
    }
}

struct SessionView2_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
            .environmentObject(FireBaseManager())
            .preferredColorScheme(.dark)
    }
}
