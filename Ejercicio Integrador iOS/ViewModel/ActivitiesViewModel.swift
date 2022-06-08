//
//  ActivitiesViewModel.swift
//  Ejercicio Integrador iOS
//
//  Created by Ivan Manuel Romero on 04/06/2022.
//

import Foundation

class ActivitiesViewModel {
    let listActivities: [String]
    
    init(){ self.listActivities = Activities.allCases.map({$0.rawValue}) }
    
    func getActivity(at index: Int)-> String{
        listActivities[index]
    }
}

enum Activities: String, CaseIterable {
    case education, recreational, social, diy, charity, cooking, relaxation, music, busywork
}
