//
//  Constants.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation

// MARK: URL's
let baseUrl = "https://api.thecatapi.com/v1"

// MARK: Keychain keys
let apiTokenKey = "com.catapi.app"

// MARK: Fetch variables
let limitItems = "12"

// MARK: View constants
let defaultSpacing: CGFloat = 16.0

// MARK: Dummy object for previews
let DefaultCatObject = Cat(id: "Short",
                           name: "British short hair",
                           origin: "UK",
                           weight: Weight(imperial: "8-18", metric: "8-18"),
                           image: CustomImageObject(id: "test",
                                                    width: 1268,
                                                    height: 966,
                                                    url: "https://cdn2.thecatapi.com/images/5iYq9NmT1.jpg"),
                           description: "random text",
                           temperament: "Affectionate, Dependent, Gentle, Intelligent, Playful")
