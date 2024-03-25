//
//  KeychainManager.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation

struct KeychainManager {
    //Save data into keychain service by given key.
    static func save(key: String, value: String) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        
        let query: [String: Any] =
        [
          kSecClass as String: kSecClassGenericPassword,
          kSecAttrAccount as String: key,
          kSecValueData as String: data
        ]
      
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    // Get data from keychain service by given key.
    static func getData(forKey key: String) -> String? {
        let query: [String: Any] =
        [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess,
        let data = result as? Data,
        let value = String(data: data, encoding: .utf8) else { return nil }
        
        return value
    }
    
    // Remove data from keychain service by given key.
    static func remove(forKey key: String) -> Bool {
        let query: [String: Any] =
        [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        let status = SecItemDelete(query as CFDictionary)

        return status == errSecSuccess
    }
}
