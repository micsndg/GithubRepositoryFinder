//
//  SearchSUViewModelProtocol.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Combine
import Foundation

@MainActor
protocol SearchSUViewModelProtocol: ObservableObject {
    var searchText: String { get set }
    var repositories: [Repository] { get }
    var state: SearchState { get }
    
    func load() async
    func search() async
    func refresh() async
}
