//
//  GitHubExplorerApp.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation
import SwiftUI

@main
struct GithubRepositoryFinder: App {
    var body: some Scene {
        WindowGroup {
            AppContainer.shared.makeSearchView()
        }
    }
}
