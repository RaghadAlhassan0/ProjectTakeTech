//
//  CardDetails.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 16/11/1443 AH.
//

import SwiftUI
import AVKit
import SDWebImageSwiftUI
struct CardDetails: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var firebaseManager: FireBaseManager
    let consultant : User
    @Binding var isShowingNoAccountWarning: Bool
    @Binding var isShowingRegistrationView: Bool
    @State var isNavLinkActive: Bool = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    if let videoUrl = URL(string: consultant.imageVideoName) {
                        VideoPlayer(player: AVPlayer(url: videoUrl))
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                    } else {
                        Image(systemName: "play.slash.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                    }
                    
                    HStack{
                        WebImage(url: URL(string: consultant.ImageURL))
                            .resizable()
                            .placeholder{ Rectangle().foregroundColor(.gray)}
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: .center)
                            .clipShape(Circle())
                        
                        VStack (alignment: .leading){
                            Text(consultant.name)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .fontWeight(.medium)
                            
                            HStack{
                                Image.init(systemName: "star.fill" )
                                    .font(.custom( "star", size: 14))
                                    .foregroundColor(Color.init("MyYellow"))
                                Text(String(format:" %.2f", consultant.rating))
                                //Text("\(Card.rating)")
                                    .font(.custom("Number", size: 10))
                                Text("\(consultant.noOFconsultations) Consultations")
                                    .font(.custom("Number", size: 10))
                            }
                            
                        }.padding(.leading, 5.0)
                        
                        Spacer()
                        
                    }.padding()
                    
                    VStack(alignment: .leading){
                        Text("\(consultant.description)")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.custom("text", size: 16))
                        //+Text("...")
                        Text("")
                        
                    } .padding(.horizontal , 25)
                    
                    
                    HStack{
                        
                        Text(consultant.major)
                            .font(.custom("Specialize", size: 12))
                            .foregroundColor(.init("blue"))
                            .padding(.vertical, 3.0)
                        Spacer()
                    }.padding(.horizontal , 29)
                    
                    
                    
                    Divider().padding(.horizontal , 30)
                    
                    HStack{
                        
                        Text("")
                        Text("\(consultant.price) SR")
                            .font(.custom("price", size: 16))
                            .foregroundColor(Color.init("MyYellow"))
                            .fontWeight(.semibold)
                        Text("")
                        Text(" / \(consultant.minutes) Minutes")
                            .font(.custom("Number", size: 13))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }.padding(.bottom, 8.0)
                        .padding(.horizontal, 25)
                    
                    
                    Button {
                        if firebaseManager.currentUser.id == "" {
                            isShowingNoAccountWarning.toggle()
                        } else {
                            isNavLinkActive.toggle()
                        }
                        
                    } label: {
                        Text("Book")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .frame(width: 340, height: 40, alignment: .center)
                            .background(.foreground)
                            .cornerRadius(6)
                            .foregroundColor(.init("blue"))
                            .padding(.bottom)
                    }
                    
                    NavigationLink(isActive: $isNavLinkActive) {
                        
                    } label: {
                    }

                }
                HStack{Spacer()}
            }.background(Color("background"))
                .alert(isPresented: $isShowingNoAccountWarning) {
                    Alert(title: Text("No Account"),
                          message: Text("You need to create an account in order to book"),
                          primaryButton: .default(Text("Create an account"), action: {
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isShowingRegistrationView.toggle()
                        }
                    }), secondaryButton: .destructive(Text("Cancel"))
                          
                    )
                }
            
                .navigationTitle("About me")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Dismiss")
                        }
                    }
                }
        }
    }
}




struct CardDetails_Previews: PreviewProvider {
    static var previews: some View {
        CardDetails(consultant: User(id: "0", ImageURL: "man1",imageVideoName: "https://cdn-tube.savefrom.to/download/417bc7ce79a27ef5d4fc65fe157da7f0/download/www.KeepVid.to--Video-CV-Sample-Video-Resume-of-Full-Stack-Developer-HireFox-www-youtube-com-720p-0bad55c0b6aae4384bcf229d4e59be19-720p.mp4", name: "Henry J", rating: 5, noOFconsultations: 0, description: "", major: "", price: 0, minutes: 0, favoriteIds: []), isShowingNoAccountWarning: .constant(false),
                    isShowingRegistrationView: .constant(false))
        .preferredColorScheme(.dark)
        .environmentObject(FireBaseManager())
    }
}

