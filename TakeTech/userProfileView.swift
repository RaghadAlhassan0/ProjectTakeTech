//
// userProfile.swift
// profilePage
//
// Created by Sara Ahmed Alshammari on 14/11/1443 AH.
//
import SwiftUI
struct userProfileView: View {
    @State var imageUrl: String = "mohammed"
    @State var name : String = "Mohammed"
    @State var email : String = "Moham@gmail.com"
    @State var password : String = "***********"
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                Color.init("background")
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing:-700){
                    VStack{
                        VStack(alignment: .leading){
                            HStack{
                                Image(imageUrl)
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .leading)
                                    .clipShape(Circle())
                            }
                            Text(name)
                                .fontWeight(.semibold)
                                .padding(.vertical)
                                .padding(.leading, 7.0)
                            HStack{
                                Image(systemName:"person.fill")
                                    .frame(width: 15, height: 25)
                                    .foregroundColor(.gray)
                                Text(name)
                                    .fontWeight(.regular)
                                    .padding(.leading, 16.0)
                                    .font(.system(size: 14))
                            }
                            Divider()
                            HStack{
                                Image(systemName:"envelope.fill")
                                    .frame(width: 15, height: 25)
                                    .foregroundColor(.gray)
                                Text(email)
                                    .padding(.leading, 16.0)
                                    .foregroundColor(.primary).font(.system(size: 14)).font(.system(size: 17))
                            }
                            Divider()
                            HStack{
                                Image(systemName:"lock.fill")
                                    .frame(width: 17, height: 25)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 16.0)
                                Text(password)
                                    .font(.system(size: 14))
                            }
                            Divider()
                            HStack{
                                Image(systemName:"heart.fill")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 2.0)
                                NavigationLink(destination: EmptyState()) {
                                    Text("My Favorite")
                                    //                    .lineLimit(1)
                                        .font(.system(size: 14))
                                        .foregroundColor(.primary)
                                        .padding()
                                    Spacer()
                                    Image(systemName:"chevron.forward")
                                    //                    .padding(.leading, 190.0)
                                    //                    .padding(.trailing, 8.0)
                                    //
                                        .foregroundColor(.white)
                                }.padding(.horizontal,0)
                            }
                            Divider()
                        }
                        Spacer()
                    }  .padding(.top, 40.0)
                        .padding(.leading, 16.0)
                    VStack{
                        Spacer()
                        Button(action:{
                        }) {
                            Text("Log Out")
                                .foregroundColor(.red)
                                .fontWeight(.medium)
                                .frame(width: 285, height: 40, alignment: .center)
                        }
                        .background(RoundedRectangle(cornerRadius: 6.0).stroke(Color.red))
                        .padding(.bottom, 80.0)
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                NavigationLink(destination: EditProfileView()) {
                    Text("Edit")
                        .font(.system(size: 17))
                        .foregroundColor(Color("blue"))
                }
            }
        }
    }
}
struct userProfile_Previews: PreviewProvider {
    static var previews: some View {
        userProfileView()
            .preferredColorScheme(.light)
    }
}
