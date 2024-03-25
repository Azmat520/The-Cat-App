//
//  ApiRequestProtocol.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation
import Combine

protocol CatApiProtocol {
    static func getList(page: Int, onSuccess: @escaping ([Cat]) -> Void, onError: @escaping (Error) -> Void) -> AnyCancellable?
}
