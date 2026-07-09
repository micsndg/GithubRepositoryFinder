//
//  SearchState.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

enum SearchState {
    case idle
    case loading
    case loaded
    case empty
    case error(String)
}
