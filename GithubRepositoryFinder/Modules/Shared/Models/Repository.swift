//
//  Repository.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

struct Repository: Decodable, Identifiable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?

    let stargazersCount: Int
    let forksCount: Int
    let openIssuesCount: Int

    let language: String?

    let htmlURL: URL

    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case language
        case htmlURL = "html_url"
        case owner
    }
}
