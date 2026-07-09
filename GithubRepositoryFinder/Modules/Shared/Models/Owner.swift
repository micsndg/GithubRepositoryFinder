//
//  Owner.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

struct Owner: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatarURL: URL

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
    }
}
