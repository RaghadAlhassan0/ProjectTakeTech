//
//  CardDetails.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 16/11/1443 AH.
//

import SwiftUI

struct CardDetails: View {
    @State var showFavourite : Bool = false
    @State var showFavourite2 : Bool = false
    @State var showFavourite3 : Bool = false
    @State var showFavourite4 : Bool = false
    @State var showFavourite5 : Bool = false
    @State var favouriteArr = []
    
    
    var Card : Card
    var body: some View {
        NavigationView{
         
            ZStack{
                Color.init("background").edgesIgnoringSafeArea(.all)
            
                VStack{
                    VStack{
                   
                    ZStack{
                        Image.init(Card.imageVideoName)
                            .resizable()
                            .frame(width: 358, height: 196)
                            .padding(.top, -17.0)
                        Image.init("play")
                            .resizable()
                            .frame(width: 31, height: 30, alignment: .center)
                        
                    }
                        HStack{
                        
                        
                            Image(Card.ImageURL)
                            .resizable()
                            .frame(width: 44, height: 44, alignment: .trailing)
                            .clipShape(Circle())
                        
                        
                        
                        
                        
                        
                        
                        VStack (alignment: .leading){
                            Text(Card.name)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .fontWeight(.medium)
                                .padding(.bottom, -3.0)
                            
                            HStack{
                                Image.init(systemName: "star.fill" )
                                    .font(.custom( "star", size: 14))
                                    .foregroundColor(.yellow)
                                
                                Text("\(Card.rating)")
                                    .font(.custom("Number", size: 10))
                                Text("\(Card.noOFconsultations) Consultations")
                                    .font(.custom("Number", size: 10))
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                        }.padding(.leading, 5.0)
                        
                        Spacer()
                        if showFavourite{
                            
                            Button {
                                showFavourite.toggle()
                                
                                
                                
                            } label: {
                                Image(systemName: ("heart.fill"))
                                    .resizable().frame(width: 20, height: 18)
                                    .foregroundColor(Color.white).padding(.vertical, 11.0)
                                
                            }
                        }
                        //                        favouriteArr.append()
                        else{
                            VStack.init( alignment: .trailing, spacing: 20){
                                Button {
                                    showFavourite.toggle()
                                } label: {
                                    Image(systemName: ("suit.heart"))
                                        .resizable().frame(width: 20, height: 18)
                                        .foregroundColor(Color.white).padding(.vertical, 11.0)
                                }
                            }
                        }
                        
                    }
                    
                    .padding()
                    

            
                
                    
                }.background(Color("gray")).cornerRadius(6)
                    .padding([.leading, .bottom, .trailing], 16.0)
                    .padding(.horizontal, 16.0)
                
                
                    
                    Text(Card.description)
                        .font(.custom("text", size: 16))
                        .padding(.horizontal, 32)
             }
                .frame(width: .infinity, height: 680, alignment: .top)
//                .padding(.horizontal, 16.0)
                
                VStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Book")
                            .foregroundColor(.black)
                            .frame(width: 312.02, height: 40, alignment: .center)
                            .background(.foreground)
                            .cornerRadius(6)
                            .foregroundColor(.init("blue"))
                            .padding(.bottom)
                    }
                }.frame(width: .infinity, height: .infinity, alignment: .center)
                
            }
            
            
            .navigationTitle("About me")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            
        }
        
    }
}

struct CardDetails_Previews: PreviewProvider {
    static var previews: some View {
        CardDetails(Card: Card(id: 0, ImageURL: "man1",imageVideoName: "https://cdn-tube.savefrom.to/download/417bc7ce79a27ef5d4fc65fe157da7f0/download/www.KeepVid.to--Video-CV-Sample-Video-Resume-of-Full-Stack-Developer-HireFox-www-youtube-com-720p-0bad55c0b6aae4384bcf229d4e59be19-720p.mp4", name: "Henry J", rating: 5, noOFconsultations: 0, description: "", major: "", price: 0, minutes: 0, faviorte2: "tessst"))
            .preferredColorScheme(.dark)
    }
}
