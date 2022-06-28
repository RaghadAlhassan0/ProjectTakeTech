//
//  consultantCard.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//



//
import AVKit
import SwiftUI
import SDWebImageSwiftUI

struct ConsultationCell: View {
    @EnvironmentObject var firebaseManger: FireBaseManager
    let consultant : User
    @State var showCardDetails = false
    @Binding var isShowingCardDetailView: Bool
    @Binding var selectedConsultant: User
    //  --------------------
    var body: some View {

        ZStack{
            Color("background").ignoresSafeArea()
            
            VStack{
                if let videoUrl = URL(string: consultant.imageVideoName) {
                    VideoPlayer(player: AVPlayer(url: videoUrl))
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                } else {
                    Image(systemName: "play.slash")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .padding(.top, 43)
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
                        .lineLimit(4)
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
                    isShowingCardDetailView.toggle()
                    selectedConsultant = consultant
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
            }.background(Color("gray")).cornerRadius(6)
            .padding([.leading, .bottom, .trailing], 16.0)
            
        }
    }
    
}

struct ConsultationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationCell(consultant: cardmodel.samples[0],
                         isShowingCardDetailView: .constant(false),
                         selectedConsultant: .constant(User(id: "", ImageURL: "", imageVideoName: "", name: "", noOFconsultations: 0, description: "", major: "", price: 0, minutes: 0)))
        .environmentObject(FireBaseManager())
        .preferredColorScheme(.dark)
    }
}
