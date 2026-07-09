//
//  Endpoint.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

protocol Endpoint {
    var path: String { get }

    var method: HTTPMethod { get }

    var queryItems: [URLQueryItem]? { get }

    var headers: [String: String]? { get }

    var body: Data? { get }
}
