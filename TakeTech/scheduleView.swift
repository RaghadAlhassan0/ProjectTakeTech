//
//  scheduleView.swift
//  macro
//
//  Created by Nada on 16/11/1443 AH.
//

import SwiftUI

struct scheduleView: View {
    @State var date = Date()
    @State private var time1 = Date()
    @State private var time2 = Date()
    @State private var days: [ScheduleModel] = []
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Select date: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                Text(date, style: .date)
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                //.datePickerStyle(.graphical)
                    .padding(.trailing, 30.0)
                Text("Select time: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    VStack {
                        DatePicker("", selection: $time1, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    Text("to")
                    VStack {
                        DatePicker("", selection: $time2, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                }
                .padding()
                Button (action: {
                    days.append(ScheduleModel(date: date, time1: time1, time2: time2))
                } ){
                    //
                    Text("Add")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(width: 250, height: 15)
                        .padding(.all)
                }
                .background(.foreground)
                .foregroundColor(.init("blue"))
                .cornerRadius(6)
                List {
                    ForEach(days, id: \.date) { day in
                        HStack{
                            Text(day.date.convertDate(formattedString: .formattedType2))
                            
                            Text(day.time1.convertDate(formattedString: .timeOnly))
                            +
                            Text("-")
                            +
                            Text(day.time2.convertDate(formattedString: .timeOnly))
                            
                        }
                    }.onDelete(perform: delete)
                }
            }
            .navigationTitle("My Schedule")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func delete(at offsets: IndexSet) {
        days.remove(atOffsets: offsets)
    }
}

struct scheduleView_Previews: PreviewProvider {
    static var previews: some View {
        scheduleView()
            .preferredColorScheme(.dark)
    }
}


    



extension Date {
    /// To convert a date to specific type
    func convertDate(formattedString: DateFormattedType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formattedString.rawValue
        return formatter.string(from: self)
    }
    /// To print 1s ago , 4d ago, 1month ago
    func convertToTimeAgo(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = style
        let now = Date()
        return formatter.string(from: self, to: now) ?? ""
    }
    
    func convertToTimeWill(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = style
        let now = Date()
        return formatter.string(from: now, to: self) ?? ""
    }
    
    func interval(ofComponent comp: Calendar.Component, from date: Date) -> Float {
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0.0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0.0 }
        return Float(start - end)
    }
    
}

enum DateFormattedType: String, CaseIterable {
    /// Date sample  Sunday, Sep 6, 2020
    case formattedType1 = "EEEE, MMM d, yyyy"
    /// Date sample  09/24/2020
    case formattedType2 = "MM/dd/yyyy"
    /// Date sample  09-06-2020 02:45 AM
    case formattedType3 = "MM-dd-yyyy h:mm a"
    /// Date sample  Sep 6, 2:45 AM
    case formattedType4 = "MMM d, h:mm a"
    /// Date sample  02:45:07.397
    case formattedType5 = "HH:mm:ss.SSS"
    /// Date sample  02:45:07.397
    case formattedType6 = "dd.MM.yy"
    /// Date sample  Sep 6, 2020
    case formattedType7 = "MMM d, yyyy"
    /// Time sample  24/05/2020 ● 9:24:22 PM
    case formattedType8 = "dd/MM/yyyy ● h:mm:ss a"
    /// Time sample  Fri23/Oct/2020
    case formattedType9 = "E d/MMM/yyy"
    /// Thu, 22 Oct 2020 5:56:22 pm
    case formattedType10 = "E, d MMM yyyy h:mm:ss a"
    /// Date sample for Month only JUNE
    case formattedType11 = "MMMM"
    /// Date sample for Day in Number only 04
    case formattedType12 = "dd"
    /// to get seconds only
    case formattedType13 = "ss"
    /// time only 9:24:22 PM
    case timeOnly = "h:mm a"
}
