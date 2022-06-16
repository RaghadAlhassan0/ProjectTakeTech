//
//  UpcomingView.swift
//  Feesback
//
//  Created by Raghad Alhassan on 08/11/1443 AH.
//

import SwiftUI

struct Upcoming: View {
    
    
    var body: some View {
        
        
        ZStack{
            
            Rectangle()
            
            
                .frame(width: 358.0, height: 190.0)
                .cornerRadius(6)
                .foregroundColor(.init("gray"))
            
            HStack{
                
                Image("ImgKhalid")
                    .resizable()
                    .frame(width:55, height: 55)
                    .padding(.trailing, 260.0)
                
                
            }.padding(.bottom, 96.0)
            
            HStack{
                Text("Khalid Almonyr")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .fontWeight(.medium)
                
                    .padding(.trailing, 56.0)
                    .padding(.bottom, 112.0)
                
            }
            
            
            VStack{
                
                HStack{
                    
                    
                    
                    Text("10 / 05 / 2022     -     02:30 PM")
                        .font(.system(size: 12, weight: .semibold, design: .default))
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .padding(.trailing, -3.0)
                    
                    
                    
                }.padding(.top,34.0)
                
                
                HStack{
                    Button(action:{
                        
                    }) {
                        
                        
                        
                        Text("Enter")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .frame(width: 157, height: 30, alignment: .center)
                            .font(.system(size: 15))
                            .background(.foreground)
                            .cornerRadius(6)
                            .foregroundColor(.init("blue"))
                        
                    }.padding(.top, 10.0)
                    
                    HStack{
                        Button(action:{
                            
                        }) {
                            
                            
                            
                            Text("Cancel")
                                .fontWeight(.medium)
                                .foregroundColor(.red)
                                .frame(width: 157, height:30 , alignment: .center)
                                .font(.system(size: 15))
                                .cornerRadius(6)
                                .background(RoundedRectangle(cornerRadius: 6.0).stroke(Color.red))
                                .foregroundColor(.red)
                            
                        }.padding(.top, 10.0)
                        
                    }
                    
                }
                
                
                HStack{
                    Text("Please be noticed that the ENTER button will be avaliable 5 minutes before the session begins and will redirect you to the zoom call immediately ")
                        .font(.system(size: 10, weight: .semibold, design: .default))
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .frame(width: 326.0)
                    
                    
                }
                .padding(.top, 6.0)
                
            }
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        Upcoming()
            .preferredColorScheme(.dark)
    }
}
