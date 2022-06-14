//
//  consultantCard.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//

import AVKit
import SwiftUI

struct consultantCard: View {
    @State var showFavourite : Bool = false
    @State var showFavourite2 : Bool = false
    @State var showFavourite3 : Bool = false
    @State var showFavourite4 : Bool = false
    @State var showFavourite5 : Bool = false
    @State var favouriteArr = []
    @State var imageVideoName = URL(string: "https://cdn-tube.savefrom.to/download/417bc7ce79a27ef5d4fc65fe157da7f0/download/www.KeepVid.to--Video-CV-Sample-Video-Resume-of-Full-Stack-Developer-HireFox-www-youtube-com-720p-0bad55c0b6aae4384bcf229d4e59be19-720p.mp4")!
    @State var imageCircleName: String = ""
    @State var expertName: String = "Henry J"
    
    @State var expertRate: Double = 3.14159265358979
    @State var noOFconsultations : Int = 25
    @State var aboutExpert : String = """
    Holds a Bachelor's degree in Information Technology, and currently work as an IT employee at the Public Telecommunications Company.  Throughout my years after graduation,  I enhanced my IT skills by working in different projects in both private and government sectors.
"""
    @State var expertMajor : String = ""
    @State var sessionPrice : Int = 350
    @State var sessionMinutes : Int = 30

    
    var body: some View {
        ForEach(cardmodel.samples, id: \.self){ cr in
        ZStack{
            Color.init("background").edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                 
                    VideoPlayer(player: AVPlayer(url: imageVideoName))

                        .frame(width: 358, height: 200)
                       
                    
                }
                
                HStack{
                    

                    Image("avatar")
                        .resizable()
                        .frame(width: 44, height: 44, alignment: .trailing)
                        .clipShape(Circle())
                    
                    
                    
                    
                    
                    
                    
                VStack (alignment: .leading){
                     
                        Text(expertName)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .fontWeight(.medium)
                        
                        HStack{
                            Image.init(systemName: "star.fill" )
                                .font(.custom( "star", size: 14))
                                .foregroundColor(.yellow)
                            Text(String(format:" %.2f", expertRate))
                            //Text("\(Card.rating)")
                                .font(.custom("Number", size: 10))
                            Text("\(noOFconsultations) Consultations")
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
                
                VStack{
               
                    Text("\(aboutExpert)").lineLimit(15)
                        .font(.custom("text", size: 12))
                    
                    
                    Text("")
                    Text(expertMajor)
                        .font(.custom("Specialize", size: 12))
                        .foregroundColor(.init("blue"))
                        .padding(.leading, -145.0)
                        .padding(.vertical, 3.0)
                } .padding(.horizontal)
                
                Divider().padding(.horizontal, 45.0)
                
                HStack{
                    Text("")
                    Text("\(sessionPrice) SR")
                        .font(.custom("price", size: 16))
                        .foregroundColor(.yellow)
                        .fontWeight(.semibold)
                    Text("")
                    Text(" / \(sessionMinutes) Minutes")
                        .font(.custom("Number", size: 13))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }.padding(.bottom, 8.0)
                    .padding(.horizontal, 25)
                
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
                
                
                
                
                
            }
            .background(Color("gray")).cornerRadius(6)
                .padding([.leading, .bottom, .trailing], 16.0)
            
            
        }
        
    }
    }
}

struct consultantCard_Previews: PreviewProvider {
    static var previews: some View {
        consultantCard()
            .preferredColorScheme(.dark)
    }
}
