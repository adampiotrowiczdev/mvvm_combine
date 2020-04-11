//
//  NetworkService.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 11/04/2020.
//

import Combine
import Foundation

class NetworkService {
    var subscription: AnyCancellable?
    
    func fetch<T:Codable>(url: String, subject: CurrentValueSubject<T?, Never>) {
        guard let url = URL(string: url) else {
        return
        }
        subscription = URLSession.shared.dataTaskPublisher(for: url).tryMap { data, _ in
        try JSONDecoder().decode(T.self, from: data) }
        .sink(receiveCompletion: { completion in if case .failure(let err) = completion {
              print("Retrieving data failed with error \(err)")
            }
          }, receiveValue: { object in
            subject.send(object)
            print("Retrieved object \(object)")
        })
    }
}
