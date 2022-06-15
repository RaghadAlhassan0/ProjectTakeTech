//
//  EditProfile.swift
//  profilePage
//
//  Created by Sara Ahmed Alshammari on 11/11/1443 AH.
//

import SwiftUI

struct EditProfile: View {
    @State var changeProfileImage = false
    @State var changeAvatarImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    @State var avatarImage = UIImage()
    @State private var Name: String = ""
    @State private var Email: String = ""
    @State private var passWord: String = ""
    var body: some View {


        VStack {
            
            
            ZStack{
                Color.init("background")
                    .edgesIgnoringSafeArea(.all)
                Color.init("background")
                
                VStack{
                    Image("avatar-1")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    
                    ZStack(alignment: .bottomTrailing){
                        Button(action: {
                            changeProfileImage = true
                            openCameraRoll = true
                            
                        }, label: {
                            if changeProfileImage {
                                Image(uiImage: imageSelected)
                                    .profileImageMod()
                                
                            } else {
                                Image("mohammed")
                                    .profileImageMod()
                                
                            }
                            
                            
                        })
                        Image (systemName: "plus")
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("MyYellow"))
                            .background(Color.white)
                            .clipShape(Circle())
                        
                        
                    }.sheet(isPresented: $openCameraRoll){
                        
                        ImagePicker(selectedImage: $imageSelected,sourceType: .photoLibrary)
                        
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Mohammed")
                            .padding(.vertical)
                        
                        
                        HStack{
                            Image(systemName:"person.fill")
                                .frame(width: 15, height: 25)
                                .foregroundColor(.gray)
                            
                            TextField(
                                "Mohammed",
                                text: $Name
                                
                            )
                            
                            .disableAutocorrection(true)
                            
                            
                            .padding(.leading, 16.0)
                            .font(.system(size: 14))
                        }
                        
                        Divider()
                        HStack{
                            Image(systemName:"envelope.fill")
                                .frame(width: 15, height: 25)
                            
                                .foregroundColor(.gray)
                            
                            TextField(
                                "Moham@gmail.com",
                                text: $Email
                            )
                            .disableAutocorrection(true)
                            .padding(.leading, 16.0)
                            .font(.system(size: 14))
                        }
                        Divider()
                        HStack{
                            Image(systemName:"lock.fill")
                                .frame(width: 17, height: 25)
                                .foregroundColor(.gray)
                            
                                .padding(.trailing, 16.0)
                            
                            TextField(
                                "************",
                                text: $passWord
                            )
                            .disableAutocorrection(true)
                            .font(.system(size: 14))
                        }
                        Divider()
                        
                        
                    }
                    
                    
                    
                    
                    Spacer()
                    
                }   .padding(.top, 40.0)
                    .padding(.leading, 16.0)
                    .padding(.bottom, 20.0)
                
                  
                VStack{
                    Spacer()
                    Button(action:{
                    }) {
                        
                        Text("Save")
                            .foregroundColor(.black)
                            .frame(width: 285, height: 40, alignment: .center)
                            .background(.foreground)
                            .cornerRadius(6)
                            .foregroundColor(.init("blue"))
                        
                    }
                    
                    .padding(.bottom, 80.0)
                }.ignoresSafeArea(.keyboard)
            
                
                
                
                
            }
            
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    
    
    
}

}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
            .preferredColorScheme(.dark)
    }
}
