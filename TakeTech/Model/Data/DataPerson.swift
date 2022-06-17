//
//  Model.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 15/11/1443 AH.
//



import Foundation

struct Card :Hashable {
    
    
    var id : Int
    var ImageURL : String
    var imageVideoName : String
    var name : String
    var rating : Double = 0.00
    var noOFconsultations : Int
    var description : String
    var major : String
    var price : Int
    var minutes : Int
    var faviorte : Bool?
    var faviorte2 : String
}


struct cardmodel {
    
    static let samples = [
        Card(id: 0, ImageURL: "henrry",imageVideoName: "https://e.top4top.io/m_235677uvd1.mp4" , name: "John smith", rating: 4.76, noOFconsultations: 25, description: "Java deveolper , different experince PHP , HTML , and different frameworks .. fixing app problems", major: "Informaton technology", price: 250, minutes: 30, faviorte2: "") ,
        Card(id: 1, ImageURL: "test Image", imageVideoName: "https://e.top4top.io/m_2356ls71k1.mp4", name: "Eddy schofield", rating: 4.53, noOFconsultations: 0, description: "test", major: "UI/UX Designer", price: 350, minutes: 30, faviorte2: ""),
        Card(id: 2, ImageURL: "test Image", imageVideoName: "https://cdn-tube.savefrom.to/download/417bc7ce79a27ef5d4fc65fe157da7f0/download/www.KeepVid.to--Video-CV-Sample-Video-Resume-of-Full-Stack-Developer-HireFox-www-youtube-com-720p-0bad55c0b6aae4384bcf229d4e59be19-720p.mp4", name: "Mohammed Ali", rating: 0, noOFconsultations: 0, description: "kkkkkkkkkkkkkkkkkkkkkkkkkkkk", major: "Computer science", price: 300, minutes: 30, faviorte2: "") ,
        Card(id: 3, ImageURL: "test Image", imageVideoName: "https://cdn-tube.savefrom.to/download/417bc7ce79a27ef5d4fc65fe157da7f0/download/www.KeepVid.to--Video-CV-Sample-Video-Resume-of-Full-Stack-Developer-HireFox-www-youtube-com-720p-0bad55c0b6aae4384bcf229d4e59be19-720p.mp4", name: "Saad Alsalem", rating: 0, noOFconsultations: 0, description: "test", major: "Cyber security", price: 300, minutes: 30, faviorte2: ""),
        Card(id: 4, ImageURL: "test Image", imageVideoName: "https://cdn-tube.savefrom.to/download/417bc7ce79a27ef5d4fc65fe157da7f0/download/www.KeepVid.to--Video-CV-Sample-Video-Resume-of-Full-Stack-Developer-HireFox-www-youtube-com-720p-0bad55c0b6aae4384bcf229d4e59be19-720p.mp4", name: "Hamzza Adnan", rating: 0, noOFconsultations: 0, description: "test", major: "IT", price: 300, minutes: 30, faviorte2: "")]

 
}







//
//import Foundation
//
//struct card :Hashable {
//
//
//    var id : Int
//    var ImageURL : String
//    var name : String
//    var rating : Double = 0.00
//    var noOFconsultations : Int
//    var description : String
//    var major : String
//    var price : Int
//    var minutes : Int
//}
//
//
//struct cardmodel {
//
////    static let samples = [card(id: 010, ImageURL: "man1", name: "Henry J", rating: 5, noOFconsultations: 25, description: "Here is the descriptions", major: "Informaton technology", price: 150, minutes: 30)]
//
//
//    static let samples = [card(id: 010, ImageURL: "man1", name: "Henry J", rating: 5, noOFconsultations: 25, description: "Here is the descriptions", major: "Informaton technology", price: 150, minutes: 30) , card(id: 0, ImageURL: "test Image", name: "nouf", rating: 0, noOFconsultations: 0, description: "test", major: "UI/UX Designer", price: 150, minutes: 30) , card(id: 0, ImageURL: "test Image", name: "arwa", rating: 0, noOFconsultations: 0, description: "test", major: "Computer science", price: 300, minutes: 30) ]
//}
