//
//  NetworkError.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

enum NetworkError: LocalizedError {

    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError(Error)
    case underlying(Error)

    var errorDescription: String? {

        switch self {

        case .invalidURL:
            return "Invalid URL."

        case .invalidResponse:
            return "Invalid server response."

        case .invalidStatusCode(let code):
            return "Request failed with status code \(code)."

        case .decodingError:
            return "Unable to decode the response."

        case .underlying(let error):
            return error.localizedDescription
        }
    }
}
