//
//  EventModel.swift
//  Ejercicio Integrador iOS
//
//  Created by Oscar Alejandro Rafael Cabanillas on 07/06/2022.
//

import Foundation

// MARK: EventM struct
struct EventM: Decodable {
    
    // MARK: - Properties
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}
