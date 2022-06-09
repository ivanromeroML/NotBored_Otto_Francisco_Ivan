//
//  Provider.swift
//  Ejercicio Integrador iOS
//
//  Created by Oscar Alejandro Rafael Cabanillas on 07/06/2022.
//

import Foundation

// MARK: EventProvider class
final class EventProvider {
    
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    func getInfoActivities(_ completion: @escaping (Result<EventM, Error>) -> Void) {
        
        let urlCase: String = getUrl()
        
        guard let url: URL = URL(string: urlCase) else {
            preconditionFailure("Invalid URL string")
        }
        
        let request: URLRequest = URLRequest(url: url)
        
        let configuration: URLSessionConfiguration = .default
        let session: URLSession = URLSession(configuration: configuration)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, _, error) in
            guard error == nil, let dataModel = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do {
                
                let decoder: JSONDecoder = JSONDecoder()
                let activity: EventM = try decoder.decode(EventM.self, from: dataModel)
                return completion(.success(activity))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func getUrl() -> String {
        switch (ParticipantsManager.shared.participants,ParticipantsManager.shared.activities){
        case (.none,.none):
            return "http://www.boredapi.com/api/activity/"
        case (.some(let participants), .none):
            return "http://www.boredapi.com/api/activity?participants=\(participants)"
        case (.none, .some(let activity)):
            return "http://www.boredapi.com/api/activity?type=\(activity.lowercased())"
        case (.some(let participants), .some(let activity)):
            return "http://www.boredapi.com/api/activity?type=\(activity.lowercased())&participants=\(participants)"
        }
    }
}

