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
    

    func deleteItems(_ favo: Card){
            
          let index = items.firstIndex(of: favo) ?? -1;
        if(index > -1) {
            items.remove(at: index);
        }
            
        }
}



