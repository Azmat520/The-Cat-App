//
//  TheCatAppApp.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

// MARK: Api token
private let apiToken = "live_9IQXIiOo591v0LieoXaVWTNHqZDVbqlHBKHsNUkuf1iZZOv3rLplY5vQswooYRET"

@main
struct TheCatAppApp: App {
    init() {
        guard KeychainManager.getData(forKey: apiTokenKey) == nil else { return } /// Escape if there is already a token is stored.
        /// For time sake we do nothing when its failed to save the token,
        /// Preferably we should show something like an alert to notice user to retry.
        let _ = KeychainManager.save(key: apiTokenKey, value: apiToken)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
