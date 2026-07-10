//
//  RepositoryDetailRepositoryImpl.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

final class RepositoryDetailRepositoryImpl: RepositoryDetailRepositoryProtocol {
    // MARK: - Properties
    private let service: RepositoryDetailServiceProtocol
    
    // MARK: - Initializer
    init(service: RepositoryDetailServiceProtocol) {
        self.service = service
    }
}

// MARK: - RepositoryDetailRepository

extension RepositoryDetailRepositoryImpl {
    func repository(
        owner: String,
        name: String
    ) async throws -> RepositoryDetail {
        try await service.repository(
            owner: owner,
            name: name
        )
    }
}
