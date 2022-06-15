//
//  FavoriteCard.swift
//  consultations
//
//  Created by Sara Ahmed Alshammari on 15/11/1443 AH.
//
import Foundation

final class pageFavo:ObservableObject{
    @Published var items :[Card]=[]
    
    func add(_ favo:Card){
        
           items.append(favo)
       }
    
    
      func deleteItems(at offests : IndexSet){
            items.remove(atOffsets: offests)
        }
}



