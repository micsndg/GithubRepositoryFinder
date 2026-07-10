//
//  RepositoryDetailEndpoint.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

enum RepositoryDetailEndpoint: Endpoint {
    case repository(
        owner: String,
        name: String
    )
    
    var path: String {
        switch self {
        case let .repository(owner, name):
            return "/repos/\(owner)/\(name)"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        APIConfiguration.headers
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var body: Data? {
        nil
    }
}
