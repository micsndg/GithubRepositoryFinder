//
//  RepositoryDetailViewModelProtocol.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

protocol RepositoryDetailViewModelProtocol: ObservableObject {
    var repository: RepositoryDetail? { get }
    var state: RepositoryDetailState { get }

    func load() async
    func refresh() async
}
