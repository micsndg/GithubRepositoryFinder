//
//  RepositoryDetailViewModel.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import SwiftUI
import Combine

@MainActor
final class RepositoryDetailViewModel: RepositoryDetailViewModelProtocol {
    // MARK: - Published
    @Published private(set) var repository: RepositoryDetail?
    @Published private(set) var state: RepositoryDetailState = .idle

    // MARK: - Properties
    private let owner: String
    private let repositoryName: String
    private let repositoryRepository: RepositoryDetailRepositoryProtocol

    // MARK: - Initializer
    init(
        owner: String,
        repositoryName: String,
        repositoryRepository: RepositoryDetailRepositoryProtocol
    ) {
        self.owner = owner
        self.repositoryName = repositoryName
        self.repositoryRepository = repositoryRepository
    }
}

// MARK: - Methods

extension RepositoryDetailViewModel {
    func load() async {
        guard repository == nil else {
            return
        }

        await fetchRepository()
    }

    func refresh() async {
        await fetchRepository()
    }
}

// MARK: - Private

private extension RepositoryDetailViewModel {
    func fetchRepository() async {
        state = .loading

        do {
            repository = try await repositoryRepository.repository(
                owner: owner,
                name: repositoryName
            )

            state = .loaded
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
