//
//  FavoriteCard.swift
//  consultations
//
//  Created by Sara Ahmed Alshammari on 15/11/1443 AH.
//
import Foundation

final class pageFavo:ObservableObject{
    @Published var items :[User]=[]
    
    func add(_ favo:User){
        
           items.append(favo)
       }
    

    func deleteItems(_ favo: User){
            
          let index = items.firstIndex(of: favo) ?? -1;
        if(index > -1) {
            items.remove(at: index);
        }
            
        }
}



