//
//  SuggestViewModel.swift
//  Ejercicio Integrador iOS
//
//  Created by Francisco Tomas Nasich on 07/06/2022.
//

import Foundation

class SuggestViewModel{
    let delegate: SuggestDelegate
    let service: EventProvider
    var testActivity: EventM?
    
    init (service: EventProvider, delegate: SuggestDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    //MARK: Data
    func loadData(){
        service.getInfoActivities { activity in
            self.testActivity = activity
            self.delegate.showData(category: activity)
            self.delegate.spinnerLoadingState(state: false)
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
