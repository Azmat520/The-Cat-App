//
//  GlobalFunctions.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation
import Combine

func performRequest<T: Decodable>( _ request: URLRequest, onSuccess: @escaping (T) -> Void, onError: @escaping (Error) -> Void ) -> AnyCancellable {
    URLSession.shared.dataTaskPublisher(for: request)
        .map(\.data)
        .decode(type: T.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { completion in
                switch completion
                {
                    case .finished:
                        break // Go to receive value on success
                    case .failure(let error):
                        onError(error) // Call onError closure on failure
                        return
                }
            }, receiveValue: { response in onSuccess(response) })
}

func getDefaultRequest(url: URL, httpMethod: String) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    if let token = KeychainManager.getData(forKey: apiTokenKey) {
        request.setValue(token, forHTTPHeaderField: "x-api-key")
    } else {
        /// Here should come a fetch call to refresh and save the token
        /// Or an alert that notice user.
    }
    
    return request
}
