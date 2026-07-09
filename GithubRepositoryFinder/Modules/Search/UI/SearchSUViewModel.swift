//
//  SearchSUViewModel.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import SwiftUI
import Combine

@MainActor
final class SearchSUViewModel: SearchSUViewModelProtocol {
    // MARK: - Published
    @Published var searchText: String = "swift"
    @Published private(set) var repositories: [Repository] = []
    @Published private(set) var state: SearchState = .idle
    
    // MARK: - Properties
    private let repository: SearchRepositoryProtocol
    
    // MARK: - Initializer
    init(repository: SearchRepositoryProtocol) {
        self.repository = repository
    }
}

// MARK: - Methods

extension SearchSUViewModel {
    func load() async {
        await search()
    }
    
    func search() async {
        
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else {
            
            repositories.removeAll()
            state = .idle
            
            return
        }
        
        state = .loading
        
        do {
            
            let repositories = try await repository.searchRepositories(
                query: query,
                page: 1
            )
            
            self.repositories = repositories
            state = repositories.isEmpty ? .empty : .loaded
            
        } catch {
            
            repositories.removeAll()
            state = .error(error.localizedDescription)
        }
    }
    
    func refresh() async {
        await search()
    }
}

// MARK: - Helpers

private extension SearchSUViewModel {
    
}

// MARK: - Getters

extension SearchSUViewModel {
    //  var someVariable2: String { model.property }
}
