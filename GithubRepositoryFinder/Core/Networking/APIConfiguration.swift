//
//  APIConfiguration.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

enum APIConfiguration {
    static let baseURL = URL(string: "https://api.github.com")!
    
    static let headers: [String: String] = [
        "Accept": "application/vnd.github+json"
    ]
}
