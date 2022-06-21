//
// UpcomingView.swift
// Feesback
//
// Created by Raghad Alhassan on 08/11/1443 AH.
//
import SwiftUI
struct Upcoming: View {
  @State private var showingAlert = false
  @State private var showingAlert2 = false
  var schedule = ScheduleModel(date: Date(), time1: Date(), time2: Date())
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
          Text("10 / 05 / 2022   -   02:30 PM")
            .font(.system(size: 12, weight: .semibold, design: .default))
            .fontWeight(.medium)
            .foregroundColor(Color.gray)
            .padding(.trailing, -3.0)
        }.padding(.top,34.0)
        HStack{
          Button("Enter"){
            //الوقت الحالي
            let currentDate = Date();
            //هذي عشان نضيف يوم للتاريخ
            var addDay = DateComponents();
            addDay.day = 1;
            //هذي عشان ينقص يوم
            var prevDay = DateComponents();
            prevDay.day = 1;
          //عرفنا متغير واعطيناه قيمة الوقت الحالي و اضفنا عليه يوم
            let _time2 = Calendar.current.date(byAdding: addDay, to: currentDate) ?? Date();
//            عرفنا متغير واعطيناه قيمه الوقت ونقصنا يوم
            let _time1 = Calendar.current.date(byAdding: prevDay, to: currentDate) ?? Date();
            if(_time1 <= currentDate && Date() <= _time2) {
              UIApplication.shared.open(URL(string:"FaceTime://+966537564520")!)
            } else {
//
              showingAlert2.toggle()
              print("----false");
            }
          }.foregroundColor(.black)
            .frame(width: 157, height: 30, alignment: .center)
            .font(.system(size: 15))
            .background(.foreground)
            .cornerRadius(6)
            .foregroundColor(.init("blue"))
            .alert("Your session has not started yet", isPresented:$showingAlert2) {
                  Button("OK", role: .cancel) { }
                }
          .padding(.top, 10.0)
          HStack{
            Button("Cancel") {
              if let Cancel = Double("") {
                // Do stuff
              } else {
                showingAlert.toggle()
              }
            }.frame(width: 157, height: 30, alignment: .center)
              .font(.system(size: 15))
              .cornerRadius(6)
              .background(RoundedRectangle(cornerRadius: 6.0).stroke(Color.red))
              .foregroundColor(.red)
              .alert("Are you sure you want to cancel the session?", isPresented: $showingAlert, actions: {
                Button("No", role: .cancel, action: {})
                Button("Yes", role: .destructive, action: {})
              }, message: {
              })
          }
          .padding(.top, 10.0)
        }
        HStack{
          Text("Please be noticed that the ENTER button will be avaliable once the session begins and will redirect you to the FaceTime call immediately ")
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
