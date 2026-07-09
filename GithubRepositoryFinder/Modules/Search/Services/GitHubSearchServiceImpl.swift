//
//  GitHubSearchServiceImpl.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

final class GitHubSearchServiceImpl: GitHubSearchServiceProtocol {
    
    // MARK: - Properties
    
    private let apiClient: APIClient
    
    // MARK: - Initializer
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

// MARK: - GitHubSearchService

extension GitHubSearchServiceImpl {
    func searchRepositories(
        query: String,
        page: Int
    ) async throws -> SearchRepositoriesResponse {
        
        let endpoint = GitHubEndpoint.searchRepositories(
            query: query,
            page: page
        )
        
        return try await apiClient.request(endpoint)
    }
}
