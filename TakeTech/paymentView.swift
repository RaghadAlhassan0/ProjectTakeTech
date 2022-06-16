//
//  paymentView.swift
//  macro
//
//  Created by Nada on 01/11/1443 AH.
//

import Foundation
import SwiftUI
struct paymentView : View{
    @State var total : Int = 0
    var body: some View {
        NavigationView{
            
            ZStack{
                Color.init("background")
           
                VStack(alignment: .leading){
                    Spacer()
                    //form
                    VStack(alignment: .leading, spacing: 30){
                        //number
                        textFeildLong(header: "Card number", placeHold: "    0000 0000 0000 0000")
                        
                        //name
                        textFeildLong(header: "Cardholder’s name", placeHold: "    Name")
                        
                        //date & cvv
                        HStack(spacing: 23){
                            //date
                            textFeildShort(header: "Expiry date", placeHold: "    MM / YY")
                            
                            //cvv
                            textFeildShort(header: "CVV", placeHold: "    3 digits")
                        }
                    }
                    .padding(.bottom)
                    //total
                    HStack(spacing: 160){
                        Text("Total amount")
                            .fontWeight(.regular)
                            .font(.system(size:18))
                        
                        Text("SR \(total)")
                            .fontWeight(.regular)
                            .font(.system(size:18))
                            .foregroundColor(Color(red: 0.8588235294117647, green: 0.7568627450980392, blue: 0.3568627450980392))
                            .padding()
                            .padding(.trailing, 16.0)
                    }
                    
                    .padding(.vertical)
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Pay")
                            .font(.system(size:18))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(width: 285, height: 40, alignment: .center)
                            .background(.foreground)
                            .foregroundColor(.init("blue"))
                            .cornerRadius(6)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 23.0)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Apple pay")
                            .fontWeight(.medium)
                            .font(.system(size:18))
                            .foregroundColor(.black)
                            .frame(width: 285, height: 40, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(6)
                    }
                    //.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 39.0)
                }
                .padding()
                .padding(.top, 25.0)
                .navigationTitle("Checkout")
                
            } .edgesIgnoringSafeArea(.all)
            
        }
        
    }
}
struct paymentView_Previews: PreviewProvider {
    static var previews: some View {
        paymentView()
            .preferredColorScheme(.dark)
    }
}
struct textFeildLong : View {
    @State public var header : String
    @State public var placeHold : String
    var body: some View{
        
        VStack(alignment: .leading, spacing: 8){
            Text(header)
                .fontWeight(.regular)
                .font(.system(size:16))
            
            TextField(placeHold, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(width: 358, height: 45, alignment: .leading)
                .background(Color(red: 0.17254901960784313, green: 0.17647058823529413, blue: 0.19607843137254902, opacity: 0.612))
                .cornerRadius(8)
        }
    }
}
struct textFeildShort : View {
    @State public var header : String
    @State public var placeHold : String
    var body: some View{
        
        VStack(alignment: .leading){
            Text(header)
                .fontWeight(.regular)
                .font(.system(size:16))
            
            TextField(placeHold, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(width: 168, height: 45, alignment: .leading)
                .background(Color(red: 0.17254901960784313, green: 0.17647058823529413, blue: 0.19607843137254902, opacity: 0.612))
                .cornerRadius(8)
        }
    }
}
