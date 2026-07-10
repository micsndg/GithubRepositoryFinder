//
//  RepositoryDetailServiceProtocol.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

protocol RepositoryDetailServiceProtocol {
    func repository(
        owner: String,
        name: String
    ) async throws -> RepositoryDetail
}
