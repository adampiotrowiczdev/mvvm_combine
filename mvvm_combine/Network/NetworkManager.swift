//
//  NetworkManager.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 11/04/2020.
//

import Combine
import Foundation

class NetworkManager {
    var subscription: AnyCancellable?
    enum HTTPError: LocalizedError {
        case statusCode(String?)
    }
    
    func fetch<T:Codable>(url: String, subject: CurrentValueSubject<T, Never>) {
        guard let url = URL(string: url) else { return }
        subscription = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, _ in
                try JSONDecoder()
            .decode(T.self, from: data) }
            .sink(receiveCompletion: { completion in
                if case .failure(let err) = completion {
              print("Retrieving data failed with error \(err)")
            }
          }, receiveValue: { object in
            DispatchQueue.main.async {
                subject.send(object)
                print("Retrieved object \(object)")
            }
        })
    }
    
    let decoder = JSONDecoder()
    
    func post<T:Codable>(url: String, subject: CurrentValueSubject<T?, Never>) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        subscription = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    let message = String(data: output.data, encoding: String.Encoding.utf8)
                    throw HTTPError.statusCode(message)//(output.response as? HTTPURLResponse)?.statusCode.toString() ?? "" + message)
                }
                return output.data
            }
            .decode(type: T.self, decoder: decoder)
            .sink(receiveCompletion: { completion in
                if case .failure(let err) = completion {
              print("Retrieving data failed with error \(err)")
            }
          }, receiveValue: { object in
            subject.send(object)
            print("Retrieved object \(object)")
        })
    }
}

extension Int {
    func toString() -> String {
        return String(self)
    }
}
