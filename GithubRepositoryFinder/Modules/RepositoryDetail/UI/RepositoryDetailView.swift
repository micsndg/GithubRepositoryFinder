//
//  RepositoryDetailView.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import SwiftUI

struct RepositoryDetailView<ViewModel: RepositoryDetailViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle, .loading:
                loadingView()

            case .loaded:
                detailView()

            case .error(let message):
                errorView(message)
            }
        }
        .navigationTitle("Repository")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.load()
        }
        .refreshable {
            await viewModel.refresh()
        }
    }
}

// MARK: - Views

private extension RepositoryDetailView {
    @ViewBuilder
    func detailView() -> some View {
        if let repository = viewModel.repository {
            List {
                Section {
                    RepositoryHeaderView(
                        repository: repository
                    )
                    .listRowInsets(
                        EdgeInsets()
                    )
                    .listRowBackground(Color.clear)
                }
                
                Section {
                    statisticRow(
                        title: "Stars",
                        value: repository.stargazersCount.formatted(),
                        systemImage: "star.fill"
                    )
                    
                    statisticRow(
                        title: "Forks",
                        value: repository.forksCount.formatted(),
                        systemImage: "tuningfork"
                    )
                    
                    statisticRow(
                        title: "Watchers",
                        value: repository.watchersCount.formatted(),
                        systemImage: "eye"
                    )
                    
                    statisticRow(
                        title: "Open Issues",
                        value: repository.openIssuesCount.formatted(),
                        systemImage: "exclamationmark.circle"
                    )
                    
                } header: {
                    Text("Statistics")
                }
                
                Section {
                    informationRow(
                        title: "Owner",
                        value: repository.owner.login
                    )
                    
                    informationRow(
                        title: "Language",
                        value: repository.language ?? "-"
                    )
                    
                    informationRow(
                        title: "Default Branch",
                        value: repository.defaultBranch
                    )
                    
                } header: {
                    Text("Information")
                }
                
                Section {
                    Link(
                        destination: repository.htmlURL
                    ) {
                        
                        Label(
                            "Open in GitHub",
                            systemImage: "safari"
                        )
                    }
                    
                }
            }
            .listStyle(.insetGrouped)
        } else {
            EmptyView()
        }
    }

    func loadingView() -> some View {
        ProgressView()
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
    }

    func errorView(
        _ message: String
    ) -> some View {

        ContentUnavailableView(
            "Unable to load repository",
            systemImage: "exclamationmark.triangle",
            description: Text(message)
        )
    }

    func statisticRow(
        title: String,
        value: String,
        systemImage: String
    ) -> some View {

        HStack {

            Label(
                title,
                systemImage: systemImage
            )

            Spacer()

            Text(value)
                .fontWeight(.medium)
        }
    }

    func informationRow(
        title: String,
        value: String
    ) -> some View {

        HStack {

            Text(title)

            Spacer()

            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}
