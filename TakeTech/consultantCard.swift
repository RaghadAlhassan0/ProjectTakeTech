//
//  consultantCard.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//

import SwiftUI

struct consultantCard: View {
    var PictureArr = ["man1" , "man2" , "man3"]
    var userName = "Henry J"
    var rate = "star.fill"
    var numOfConsulation = 350
    var discription = ""
    var price = Int()
    var sessionTime = Int()
    
    
    var body: some View {
        ZStack{
            Color.init("background").edgesIgnoringSafeArea(.all)
            
            ZStack{
            Rectangle().frame(width: 327, height: 444)
                .cornerRadius(6)
                .foregroundColor(.init("gray"))
                VStack{
                Image.init(PictureArr[0])
                    .resizable()
                    .frame(width: 327, height: 196)
                    .padding(.top, -17.0)
                 
                    HStack{
                        
                        Circle().frame(width: 45, height: 45, alignment: .trailing)
                        
                        
                        VStack (alignment: .leading){
                        Text(userName)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                    .fontWeight(.medium)
                            
                            HStack{
                            Image.init(systemName: rate )
                                    .font(.custom( "star", size: 14))
                                .foregroundColor(.yellow)
                                
                                Text("4.84")
                                    .font(.custom("Number", size: 10))
                                Text("\(numOfConsulation) Consultations")
                                    .font(.custom("Number", size: 10))
                                
                                
                            }
                        }.padding(.leading, 5.0)
                        
                        Spacer()
                        Image.init(systemName: "heart")
                        
                        
//                        ---------------vstack
                        
                    }
                    .padding([ .leading, .trailing], 29.0)
                    .padding()
                    
                    
                    Text("""
Holds a Bachelor's degree in Information
Technology, an employee at the Public Telecommunications ....
""")
                    .font(.custom("text", size: 12))
                    .padding(.horizontal, 54.0)
                    .padding(.bottom, 5.0)
                    
                    
                    Divider().padding(.horizontal, 45.0)
                    
                    HStack{
                        
                        Text("100 SR")
                            .font(.custom("price", size: 16))
                            .foregroundColor(.yellow)
                            .fontWeight(.semibold)
                        Text(" / 30 Minutes")
                            .font(.custom("Number", size: 11))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }.padding(.bottom, 8.0)
                        .padding(.horizontal, 51.609)
                   
                    
                    Text("Book")
                        .foregroundColor(.black)
                       .frame(width: 285, height: 40, alignment: .center)
                       .background(.foreground)
                       .cornerRadius(6)
                       .foregroundColor(.init("blue"))
                    
                    
                    
                }
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
