//
//  RepositoryHeaderView.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import SwiftUI

struct RepositoryHeaderView: View {
    let repository: RepositoryDetail

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(
                url: repository.owner.avatarURL
            ) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(
                width: 96,
                height: 96
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(spacing: 8) {
                Text(repository.fullName)
                    .font(.title2.bold())

                if let description = repository.description {
                    Text(description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
