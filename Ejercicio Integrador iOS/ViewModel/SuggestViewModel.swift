//
//  SuggestViewModel.swift
//  Ejercicio Integrador iOS
//
//  Created by Francisco Tomas Nasich on 07/06/2022.
//

import Foundation

class SuggestViewModel{
    let service: EventProvider
    let delegate: SuggestDelegate
    
    init (service: EventProvider, delegate: SuggestDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    //MARK: Category
     func getCategory() {
         service.getInfoActivities { activity in
             self.delegate.loadData(category: activity)
         }
         }
    
    //MARK: Price
     func getPrice(price: Double) -> String {
        switch price {
        case 0:
            return "Free"
        case 0.1...0.3:
            return "Low"
        case 0.3...0.6:
            return "Medium"
        case 0.7...0.9 :
            return "High"
        default:
            return "Free"
        }
    }
}
