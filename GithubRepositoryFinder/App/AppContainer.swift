//
//  App.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import SwiftUI

final class AppContainer {
    static let shared = AppContainer()

    private init() {}

    lazy var apiClient: APIClient = URLSessionAPIClient()
}

extension AppContainer {
    func makeSearchView() -> some View {
        
        let service = GitHubSearchServiceImpl(
            apiClient: apiClient
        )
        
        let repository = SearchRepositoryImpl(
            service: service
        )
        
        let viewModel = SearchSUViewModel(
            repository: repository
        )
        
        return SearchSUView(
            viewModel: viewModel
        )
    }
}
