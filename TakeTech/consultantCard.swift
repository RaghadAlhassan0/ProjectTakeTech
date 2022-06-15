//
//  consultantCard.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//



//
import AVKit
import SwiftUI
struct ConsultationCell: View {
//  let appetizer : Appetizer
  @EnvironmentObject var viewModel : pageFavo
  let card : Card
  @State var items = []
  @State var showFavourite : Bool = false
  @State var showFavourite2 : Bool = false
  @State var showFavourite3 : Bool = false
  @State var showFavourite4 : Bool = false
  @State var showFavourite5 : Bool = false
  @State var favoriteArry = [String]()
  @State var favouriteArr = []
    
    @State var showCardDetails = false

  //  --------------------
  var body: some View {
    // ForEach(cardmodel.samples, id: \.self){ cr in
      ZStack{
        Color.init("background").edgesIgnoringSafeArea(.all)
        VStack{
          ZStack{
//
            VideoPlayer(player: AVPlayer(url: URL(string: card.imageVideoName)!))
              .frame(width: 358, height: 200)
          }
          HStack{
            Image(card.ImageURL)
              .resizable()
              .frame(width: 44, height: 44, alignment: .trailing)
              .clipShape(Circle())
            VStack (alignment: .leading){
              Text(card.name)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .fontWeight(.medium)
              HStack{
                Image.init(systemName: "star.fill" )
                  .font(.custom( "star", size: 14))
                  .foregroundColor(Color.init("MyYellow"))
                Text(String(format:" %.2f", card.rating))
                //Text("\(Card.rating)")
                  .font(.custom("Number", size: 10))
                Text("\(card.noOFconsultations) Consultations")
                  .font(.custom("Number", size: 10))
              }
                
                
                
                
                
            }.padding(.leading, 5.0)

            Spacer()

          }
          .padding()
            
          .overlay(HStack(alignment: .top){
              Spacer()
              if showFavourite{
                Button {
  //                   تعددديل خوله ------
  //                viewModel.add(Card)
                  showFavourite.toggle()
  //                favouriteArr
                } label: {
                  Image(systemName: ("heart.fill"))
                    .resizable().frame(width: 20, height: 18)
                    .foregroundColor(Color.white).padding(.vertical, 11.0)
                }
              }
              //            favouriteArr.append()
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
          }.padding(.horizontal , 16)
          
          )
          VStack{
            Text("\(card.description)").lineLimit(15)
              .font(.custom("text", size: 12))
              .onTapGesture {
                  
                  showCardDetails.toggle()
              }
              //+Text("...")
            Text("")
            Text(card.major)
              .font(.custom("Specialize", size: 12))
              .foregroundColor(.init("blue"))
              .padding(.leading, -145.0)
              .padding(.vertical, 3.0)
          } .padding(.horizontal)
          Divider().padding(.horizontal, 45.0)
          HStack{
            Text("")
            Text("\(card.price) SR")
              .font(.custom("price", size: 16))
              .foregroundColor(Color.init("MyYellow"))
              .fontWeight(.semibold)
            Text("")
            Text(" / \(card.minutes) Minutes")
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
        .sheet(isPresented: $showCardDetails) {
            Text("Card details")
        }
      }
    // }
  }
}
struct ConsultationCell_Previews: PreviewProvider {
  static var previews: some View {
    ConsultationCell(card: cardmodel.samples[0])
      .preferredColorScheme(.dark)
  }
}

