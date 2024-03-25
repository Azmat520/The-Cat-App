//
//  CatListViewModel.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import Foundation
import Combine

class CatListViewModel: ObservableObject {
    @Published var catList: [Cat] = []
    
    private var cancellable: AnyCancellable?
    private var page: Int = 1
    
    func getList() {
        cancellable?.cancel() /// Cancel previous fetch call if its still going on.
        cancellable = CatApiRequests.getList(page: page, onSuccess: initList(_:), onError: handleError(_:))
    }
}

// MARK: - Private functions
extension CatListViewModel {
    private func initList(_ cats: [Cat]) {
        catList.removeAll()
        catList = cats
    }
    
    private func handleError(_ error: Error) {
        print("error is \(error.localizedDescription)")
    }
}
