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
        service.getInfoActivities { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else {return}
                switch result {
                case .success(let resultActivity):
                    self.testActivity = resultActivity
                    self.delegate.showData()
                    self.delegate.spinnerLoadingState(state: false)
                case .failure(_):
                    self.delegate.showData()
                    self.delegate.spinnerLoadingState(state: false)
                }
            }
        }
    }
    
    //MARK: Price
    func getPrice(price: Double) -> String {
        switch price {
        case 0:
            return "Free"
        case 0..<0.4:
            return "Low"
        case 0.4..<0.7:
            return "Medium"
        case 0.7... :
            return "High"
        default:
            return "Free"
        }
    }
}
