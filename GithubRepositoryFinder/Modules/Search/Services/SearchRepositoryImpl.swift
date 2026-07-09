//
//  SearchRepositoryImpl.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

final class SearchRepositoryImpl: SearchRepositoryProtocol {
    
    // MARK: - Properties
    
    private let service: GitHubSearchServiceProtocol
    
    // MARK: - Initializer
    
    init(service: GitHubSearchServiceProtocol) {
        self.service = service
    }
}

// MARK: - SearchRepository

extension SearchRepositoryImpl {
    func searchRepositories(
        query: String,
        page: Int
    ) async throws -> [Repository] {
        
        let response = try await service.searchRepositories(
            query: query,
            page: page
        )
        
        return response.items
    }
}
