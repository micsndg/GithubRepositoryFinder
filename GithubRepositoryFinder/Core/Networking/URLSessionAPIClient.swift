//
//  URLSessionAPIClient.swift
//  GithubRepositoryFinder
//
//  Created by Michael San Diego on 7/10/26.
//

import Foundation

final class URLSessionAPIClient: APIClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - Method

extension URLSessionAPIClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        var components = URLComponents(
            url: APIConfiguration.baseURL,
            resolvingAgainstBaseURL: false
        )

        components?.path = endpoint.path
        components?.queryItems = endpoint.queryItems

        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)

        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body

        endpoint.headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        do {

            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard 200...299 ~= httpResponse.statusCode else {
                throw NetworkError.invalidStatusCode(httpResponse.statusCode)
            }

            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError(error)
            }

        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.underlying(error)
        }
    }
}
