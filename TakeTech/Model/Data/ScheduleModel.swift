//
//  ScheduleModel.swift
//  TakeTech
//
//  Created by Nada on 17/11/1443 AH.
//
import Foundation
struct ScheduleModel: Identifiable{
  var id = UUID().uuidString
  var date : Date
  var time1 : Date
  var time2 : Date
}
