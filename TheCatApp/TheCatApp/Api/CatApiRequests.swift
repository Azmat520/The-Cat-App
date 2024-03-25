//
//  CatApiRequests.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation
import Combine

struct CatApiRequests: CatApiProtocol {
    static func getList(page: Int, onSuccess: @escaping ([Cat]) -> Void, onError: @escaping (any Error) -> Void) -> AnyCancellable? {
        let path = baseUrl + "/breeds/?page=\(page)&limit=\(limitItems)"
        guard let url = URL(string: path) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiToken, forHTTPHeaderField: "x-api-key")
        
        return performRequest(request, onSuccess: onSuccess, onError: onError)
    }
}
