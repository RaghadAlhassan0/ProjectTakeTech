//
//  Model.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 15/11/1443 AH.
//

import Foundation


import Foundation

struct card :Hashable {
    
    
    var id : Int
    var ImageURL : String
    var name : String
    var rating : Double = 0.00
    var noOFconsultations : Int
    var description : String
    var major : String
    var price : Int
    var minutes : Int
}


struct cardmodel {
    
//    static let samples = [card(id: 010, ImageURL: "man1", name: "Henry J", rating: 5, noOFconsultations: 25, description: "Here is the descriptions", major: "Informaton technology", price: 150, minutes: 30)]
    
    
    static let samples = [card(id: 010, ImageURL: "man1", name: "Henry J", rating: 5, noOFconsultations: 25, description: "Here is the descriptions", major: "Informaton technology", price: 150, minutes: 30) , card(id: 0, ImageURL: "test Image", name: "nouf", rating: 0, noOFconsultations: 0, description: "test", major: "UI/UX Designer", price: 150, minutes: 30) , card(id: 0, ImageURL: "test Image", name: "arwa", rating: 0, noOFconsultations: 0, description: "test", major: "Computer science", price: 300, minutes: 30) ]
}
