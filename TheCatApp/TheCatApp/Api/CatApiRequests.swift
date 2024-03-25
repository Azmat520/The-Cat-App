//
//  CatApiRequests.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation
import Combine

/// Future enhancement add GET & POST request to favorite api.
/// So you can keep the favorite list persistent.

struct CatApiRequests: CatApiProtocol {
    static func getList(page: Int, onSuccess: @escaping ([Cat]) -> Void, onError: @escaping (any Error) -> Void) -> AnyCancellable? {
        let path = baseUrl + "/breeds/?page=\(page)&limit=\(limitItems)"
        guard let url = URL(string: path) else { return nil }
        
        let request = getDefaultRequest(url: url, httpMethod: "GET")
        
        return performRequest(request, onSuccess: onSuccess, onError: onError)
    }
}
