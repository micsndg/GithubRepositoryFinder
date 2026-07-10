//
//  RepositoryDetail.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

struct RepositoryDetail: Decodable {
    let id: Int
    let fullName: String
    let description: String?
    let language: String?
    let stargazersCount: Int
    let forksCount: Int
    let watchersCount: Int
    let openIssuesCount: Int
    let defaultBranch: String
    let htmlURL: URL
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case language
        case description

        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case watchersCount = "watchers_count"
        case openIssuesCount = "open_issues_count"
        case defaultBranch = "default_branch"
        case htmlURL = "html_url"
    }
}
