//
//  ScheduleModel.swift
//  TakeTech
//
//  Created by Nada on 17/11/1443 AH.
//
import Foundation
struct ScheduleModel: CustomStringConvertible ,Identifiable{
  var id = UUID().uuidString
  // formate
  var date : Date
  var time1 : Date
  var time2 : Date
    
  var description: String {
    var format :String = "\(date.formatted(date: .abbreviated, time: .omitted))    \(time1.formatted(date: .omitted, time: .shortened)) - \(time2.formatted(date: .omitted, time: .shortened))"
    return format
  }
}
