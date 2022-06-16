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
    // @State private var days = ["Mon, 2 May    8:30 - 9:00", "Wed, 4 May    9:30 - 9:30", "Sun, 15 May    8:30 - 9:00"]
    var body: some View {
        NavigationView {
       
                
                VStack{
                    List {
                        ForEach(days, id: \.date) { day in
                            Text(days.description)
                            //            ForEach(days, id: \.self) { day in
                            //              Text("8:30 - 9:00")
                            //            }
                        }
                        .onDelete(perform: delete)
                    }
                    .toolbar {
                        EditButton()
                    }
                    .padding(.bottom, -67.0)
                    Divider()
                        .padding(.top, 69.0)
                    Text("Select date: ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    Text(date, style: .date)
                    DatePicker("", selection: $date, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
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
                    Spacer()
                        .padding(.all)
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
