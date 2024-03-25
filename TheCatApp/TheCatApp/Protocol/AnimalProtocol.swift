//
//  AnimalProtocol.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation

protocol AnimalProtocol {
    var id: String { get set }
    var name: String { get set }
    var origin: String { get set }
    var weight: Weight { get set }
    var image: CustomImageObject { get set }
    var description: String { get set }
    var temperament: String { get set }
}
