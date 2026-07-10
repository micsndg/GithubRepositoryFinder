//
//  RepositoryDetailState.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

enum RepositoryDetailState {
    case idle
    case loading
    case loaded
    case error(String)
}
