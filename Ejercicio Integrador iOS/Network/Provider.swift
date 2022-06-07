//
//  Provider.swift
//  Ejercicio Integrador iOS
//
//  Created by Oscar Alejandro Rafael Cabanillas on 07/06/2022.
//

import Foundation

// MARK: EventProvider class
final class EventProvider {
    
    func getInfoActivities(_ completion: @escaping (EventM) -> Void) {
        
        guard let url: URL = URL(string: "https://www.boredapi.com/api/activity?type=recreational&participants=1") else {
            preconditionFailure("Invalid URL string")
        }
        
        let request: URLRequest = URLRequest(url: url)
        
        let configuration: URLSessionConfiguration = .default
        let session: URLSession = URLSession(configuration: configuration)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, _, error) in
            guard error == nil, let data = data else {
                preconditionFailure("Task error \(error?.localizedDescription ?? "")")
            }
            
            do {
                
                let decoder: JSONDecoder = JSONDecoder()
                let activity: EventM = try decoder.decode(EventM.self, from: data)
                return completion(activity)
                
            } catch {
                
                preconditionFailure(error.localizedDescription)
                
            }
        }
        task.resume()
    }
    
}

