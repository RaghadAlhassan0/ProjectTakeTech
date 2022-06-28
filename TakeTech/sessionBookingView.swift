//
//  sessionBookingView.swift
//  sessionView
//
//  Created by Nada on 21/11/1443 AH.
//

import SwiftUI
let recUnavailable = Color(red: 0.17254901960784313,  green: 0.17647058823529413, blue: 0.19607843137254902)
let textUnavailable = Color(red: 0.32941176470588235, green: 0.32941176470588235, blue: 0.3568627450980392)
let recAvailable = Color(red: 0.17254901960784313,    green: 0.17647058823529413, blue: 0.19607843137254902)
let textSelected = Color(red: 0.3607843137254902,     green: 0.6666666666666666,  blue: 0.803921568627451)

let dates: [Date] = {
    (0...10).map { offset in
        Calendar.current.date(byAdding: .day, value: offset, to: Date()) ?? Date()
    }
}()

func formatDate(_ date: Date, format: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = format
    
    return dateFormatterGet.string(from: date)
}
struct sessionBookingView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    @State private var text: String = ""
    @State var selectedDate: Date = Date()
    @State private var selectedHourndex: Int = -1
    @State private var hour: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("When do you want to meet?")
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .font(.system(size:25))
                .frame(width: 220, height:63, alignment: .leading)
                .padding([.top, .leading, .trailing])
            
            //Dates
            Text("Select a date")
                .font(.system(size:16))
                .fontWeight(.semibold)
                .padding([.top, .leading, .trailing])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 12) {
                    ForEach(dates, id: \.self) { date in
                        DayView(date: date, selectedDate: self.$selectedDate)
                    }
                }
            }
            .padding(.vertical)
            .padding(.leading, 16.0)

            
            //  Times
            VStack(alignment: .leading, spacing: 30) { createTimeView() }
            
                         
            Text("Describe your consultation")
                .font(.system(size:16))
                .fontWeight(.semibold)
                .padding()
            
            TextEditor(text: $text)
                .frame(width: 358, height: 125, alignment: .leading)
                .background(recUnavailable)
                .cornerRadius(6)
                .padding(.leading)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Next")
                    .font(.system(size:18))
                    .foregroundColor(.black)
                    .frame(width: 285, height: 40, alignment: .center)
                    .background(Color(red: 0.3607843137254902, green: 0.6666666666666666, blue: 0.803921568627451))
                    .cornerRadius(6)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding(.leading, 34)
            
        }
    }
    
    fileprivate func createTimeView() -> some View {
        VStack(alignment: .leading) {
            Text("Select a time") .font(.system(size:16))
                .fontWeight(.semibold).padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8){
                    ForEach(10..<21, id: \.self){ i in
                        TimeView(index: i, isSelected: self.selectedHourndex == i, onSelect: { selectedIndex in
                            self.selectedHourndex = selectedIndex
                            self.hour = "\(selectedIndex):00"
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }
}


struct sessionBookingView_Previews: PreviewProvider {
    static var previews: some View {
        sessionBookingView()
            .preferredColorScheme(.dark)
    }
}
struct DayView: View {
    var date: Date
    @Binding var selectedDate: Date
    var isSelected: Bool { selectedDate == date }
    var body: some View {
        
        VStack(spacing:8){
            Text(dayNumber).font(.system(size:20)).fontWeight(.bold).foregroundColor(isSelected ? textSelected : Color.white)
            Text(dayMonth).font(.system(size:10)).foregroundColor(isSelected ? textSelected : Color.white).fontWeight(isSelected ?.bold : .regular)
            Rectangle()
                .frame(width: 10.78, height: 1.5)
                .foregroundColor(isSelected ? textSelected : Color.white)
            Text(dayName).font(.system(size:10)).foregroundColor(isSelected ? textSelected : Color.white).fontWeight(isSelected ?.bold : .regular)
        }
        .frame(width: 64, height: 97)
        .background(isSelected ? Color.white : recAvailable)
        .cornerRadius(6)
        .onTapGesture { self.selectedDate = self.date }
    }
    
    var dayName: String { return formatDate("EEE").uppercased() }
    var dayMonth: String { return formatDate("MMM").uppercased() }
    var dayNumber: String { return formatDate("d") }
    
    func formatDate(_ format: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = format
        
        return dateFormatterGet.string(from: date)
    }
}

struct SelectedDayView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        Text(dayName).font(.system(.title)).foregroundColor(textSelected)
    }
    
    var dayName: String {
        if Calendar.current.isDateInToday(selectedDate) {
            return "Today"
        } else if Calendar.current.isDateInTomorrow(selectedDate) {
            return "Tomorrow"
        } else {
            return formatDate(selectedDate, format: "EEEE")
        }
    }
}


struct TimeView: View {
    let recAvailable = Color(red: 0.17254901960784313, green: 0.17647058823529413, blue: 0.19607843137254902)
    let textSelected = Color(red: 0.3607843137254902, green: 0.6666666666666666, blue: 0.803921568627451)
    
    var index: Int = 0
    var isSelected: Bool = false
    var onSelect: ((Int)->()) = {_ in }
var body: some View {
        Text("\(index):30")
        .foregroundColor(isSelected ? textSelected : .white)
        .fontWeight(isSelected ?.semibold : .regular)
            .padding()
            .background( isSelected ? Color.white : recAvailable)
            .cornerRadius(10).onTapGesture {
                self.onSelect(self.index)
        }
    }
}
