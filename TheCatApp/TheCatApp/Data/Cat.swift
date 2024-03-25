//
//  Cat.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation

struct Cat: AnimalProtocol, Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var origin: String
    var weight: Weight
    var image: CustomImageObject
    var description: String
    var temperament: String
}

struct Weight: Codable, Hashable {
    let imperial: String
    let metric: String
}

struct CustomImageObject: Codable, Hashable {
    let id: String
    let width: Int
    let height: Int
    let url: String
}
