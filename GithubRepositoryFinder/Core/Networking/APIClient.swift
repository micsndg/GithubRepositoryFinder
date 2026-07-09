//
//  APIClient.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

protocol APIClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
