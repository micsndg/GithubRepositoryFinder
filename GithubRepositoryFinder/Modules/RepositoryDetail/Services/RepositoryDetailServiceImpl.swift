//
//  RepositoryDetailServiceImpl.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

final class RepositoryDetailServiceImpl: RepositoryDetailServiceProtocol {
    // MARK: - Properties
    private let apiClient: APIClient
    
    // MARK: - Initializer
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

// MARK: - RepositoryDetailService

extension RepositoryDetailServiceImpl {
    func repository(
        owner: String,
        name: String
    ) async throws -> RepositoryDetail {
        let endpoint = RepositoryDetailEndpoint.repository(
            owner: owner,
            name: name
        )
        
        return try await apiClient.request(endpoint)
    }
}
