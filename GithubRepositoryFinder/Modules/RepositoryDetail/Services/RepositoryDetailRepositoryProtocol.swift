//
//  RepositoryDetailRepositoryProtocol.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

protocol RepositoryDetailRepositoryProtocol {
    func repository(
        owner: String,
        name: String
    ) async throws -> RepositoryDetail
}
