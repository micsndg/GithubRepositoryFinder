//
//  SearchRepositoryProtocol.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

protocol SearchRepositoryProtocol {
    func searchRepositories(
        query: String,
        page: Int
    ) async throws -> [Repository]
}
