//
//  GitHubEndpoint.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

enum GitHubEndpoint: Endpoint {
    case searchRepositories(
        query: String,
        page: Int
    )
    
    var path: String {
        switch self {
        case .searchRepositories:
            return "/search/repositories"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String: String]? {
        APIConfiguration.headers
    }
    
    var body: Data? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        
        switch self {
            
        case let .searchRepositories(query, page):
            
            return [
                URLQueryItem(
                    name: "q",
                    value: query
                ),
                URLQueryItem(
                    name: "page",
                    value: "\(page)"
                ),
                URLQueryItem(
                    name: "per_page",
                    value: "20"
                )
            ]
        }
    }
}
