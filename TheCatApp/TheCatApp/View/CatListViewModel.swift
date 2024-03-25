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
    @Published var searchTerm: String = emptyString
    @Published var selection: TabViews = .Favorite
    @Published var favoriteCatList: [Cat] = []
    @Published var isLoading: Bool = false
    
    private var cancellable: AnyCancellable?
    private var page: Int = 1
    
    var filteredList: [Cat] {
        guard !searchTerm.isEmpty else { return catList }
        return catList.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }
    
   
    
    func getList() {
        isLoading = true
        cancellable?.cancel() /// Cancel previous fetch call if its still going on.
        cancellable = CatApiRequests.getList(page: page, onSuccess: initList(_:), onError: handleError(_:))
    }
    
    func exploreList() { selection = .Cats }
    
    func toggleFavorite(_ pet: AnimalProtocol) {
        guard let cat = pet as? Cat else { return }
        
        guard let index = favoriteCatList.firstIndex(where: { $0.id == cat.id })
        else {
            favoriteCatList.append(cat)
            return
        }
        
        favoriteCatList.remove(at: index)
    }
    
    func isFavorite(_ pet: AnimalProtocol) -> Bool {
        guard let cat = pet as? Cat else { return false }
        return favoriteCatList.contains { $0.id == cat.id }
    }
}

// MARK: - Private functions
extension CatListViewModel {
    private func initList(_ cats: [Cat]) {
        catList.removeAll()
        catList = cats
        isLoading = false
    }
    
    private func handleError(_ error: Error) {
        //TODO: - Replace this with a proper error handler.
        print("error is \(error.localizedDescription)")
        isLoading = false
    }
}
