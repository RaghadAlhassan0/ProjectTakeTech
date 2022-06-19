//
//  EmptyState.swift
//  consultations
//
//  Created by Sara Ahmed Alshammari on 15/11/1443 AH.
//

import SwiftUI

struct EmptyState: View {
    @State var showCardDetails = false
    @EnvironmentObject var viewModel : pageFavo
    
    var body: some View {
        
       // Text("Hello, World!")
        ForEach(viewModel.items, id: \.self) { sample in
          //  ConsultationCell(card: sample)
            //Text(sample.name)
            VStack{
                HStack{
                    Image(sample.ImageURL)
                        .resizable()
                        .frame(width: 44, height: 44, alignment: .trailing)
                        .clipShape(Circle())

                    VStack (alignment: .leading){
                        Text(sample.name)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .fontWeight(.medium)

                        HStack{
                            Image.init(systemName: "star.fill" )
                                .font(.custom( "star", size: 14))
                                .foregroundColor(Color.init("MyYellow"))
                            Text(String(format:" %.2f", sample.rating))
                                .font(.custom("Number", size: 10))
                            Text("\(sample.noOFconsultations) Consultations")
                                .font(.custom("Number", size: 10))
                        }



                    }.padding(.leading, 5.0)

                    Spacer()

                }
                .padding()
                VStack(alignment: .leading){
                    Text("\(sample.description)").lineLimit(1)
                        .font(.custom("text", size: 14))
                        .onTapGesture {

                            showCardDetails.toggle()
                        }
                    Text("...")
                    Text("")

                } .padding(.horizontal , 25)


                HStack{

                    Text(sample.major)
                        .font(.custom("Specialize", size: 12))
                        .foregroundColor(.init("blue"))
                        .padding(.vertical, 3.0)
                        Spacer()
                }.padding(.horizontal , 29)



                Divider().padding(.horizontal , 30)

                HStack{

                    Text("")
                    Text("\(sample.price) SR")
                        .font(.custom("price", size: 16))
                        .foregroundColor(Color.init("MyYellow"))
                        .fontWeight(.semibold)
                    Text("")
                    Text(" / \(sample.minutes) Minutes")
                        .font(.custom("Number", size: 13))
                        .foregroundColor(.gray)

                    Spacer()
                }.padding(.bottom, 8.0)
                    .padding(.horizontal, 25)

            }   .background(Color("gray")).cornerRadius(6)
                .padding([.leading, .bottom, .trailing], 16.0)
                .fullScreenCover(isPresented: $showCardDetails, content: {
                    CardDetails(Card: sample)
                    
                })
         //   print(sample.name)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
