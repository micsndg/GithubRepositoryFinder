//
//  SearchSUView.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import SwiftUI

struct SearchSUView<ViewModel: SearchSUViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            content()
                .navigationTitle("Repositories")
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search repositories"
        )
        .task {
            await viewModel.load()
        }
        .onSubmit(of: .search) {
            Task {
                await viewModel.search()
            }
        }
        .refreshable {
            await viewModel.refresh()
        }
    }
}

// MARK: - Views

private extension SearchSUView {
    @ViewBuilder
    func content() -> some View {
        switch viewModel.state {
        case .idle:
            emptyStateView()
            
        case .loading:
            loadingView()
            
        case .loaded:
            repositoryList()
            
        case .empty:
            ContentUnavailableView.search
            
        case .error(let message):
            errorView(message)
        }
    }
    
    func loadingView() -> some View {
        List(0..<8, id: \.self) { _ in
            repositoryRowPlaceholder()
        }
        .listStyle(.plain)
        .redacted(reason: .placeholder)
        .allowsHitTesting(false)
    }
    
    func emptyStateView() -> some View {
        ContentUnavailableView(
            "Search GitHub Repositories",
            systemImage: "magnifyingglass",
            description: Text("Search by repository name, language or owner.")
        )
    }
    
    func errorView(_ message: String) -> some View {
        ContentUnavailableView(
            "Something went wrong",
            systemImage: "exclamationmark.triangle",
            description: Text(message)
        )
    }
    
    func repositoryList() -> some View {
        List(viewModel.repositories) { repository in
            repositoryRow(repository: repository)
        }
        .listStyle(.plain)
    }
    
    func repositoryRow(repository: Repository) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(repository.fullName)
                .font(.headline)
            
            if let description = repository.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            
            HStack {
                Label(
                    "\(repository.stargazersCount)",
                    systemImage: "star.fill"
                )
                
                Label(
                    "\(repository.forksCount)",
                    systemImage: "tuningfork"
                )
                
                Spacer()
                
                Text(repository.language ?? "-")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 8)
    }
    
    func repositoryRowPlaceholder() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 4)
            
            RoundedRectangle(cornerRadius: 4)
            
            HStack {
                RoundedRectangle(cornerRadius: 4)
                
                RoundedRectangle(cornerRadius: 4)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 4)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Helpers

private extension SearchSUView {
    
}
