//
//  NetworkManager.swift
//  StarWars
//
//  Created by Abdelrhman Elmahdy on 15/03/2023.
//

import BtechFoundation
import Combine
import Foundation
import Network

public struct NetworkManager: NetworkManagerProtocol {
    static let monitor: NWPathMonitor = {
        let monitor = NWPathMonitor()

        monitor.pathUpdateHandler = { path in
            isConnected = path.status == .satisfied
        }

        return monitor
    }()

    static var isConnected = false

    private let sessionConfiguration: URLSessionConfiguration
    private let session: URLSession

    public init(sessionConfiguration: URLSessionConfiguration = .default) {
        self.sessionConfiguration = sessionConfiguration
        session = URLSession(configuration: sessionConfiguration)
    }

    public func executeRequest<T: Decodable>(_ endpoint: any RemoteEndpoint) async -> Result<T, NetworkRequestError> {
        let urlRequest: URLRequest
        do { urlRequest = try endpoint.getURLRequest(isConnected: Self.isConnected) }
        catch { return .failure(NetworkRequestError.badRequest()) }

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            if let httpStatusCode = (response as? HTTPURLResponse)?.statusCode {
                guard (200 ... 299) ~= httpStatusCode else {
                    return .failure(.httpResponseError(statusCode: httpStatusCode))
                }
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                return .success(result)
            } catch { return .failure(NetworkRequestError(error: error)) }

        } catch { return .failure(.invalidResponse()) }
    }

    public func executeRequest<T: Decodable>(_ endpoint: any RemoteEndpoint, responseType: T.Type, completion: @escaping (T?, NetworkRequestError?) -> Void) {
        let urlRequest: URLRequest
        do { urlRequest = try endpoint.getURLRequest(isConnected: Self.isConnected) }
        catch {
            completion(nil, NetworkRequestError.badRequest())
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(nil, NetworkRequestError(error: error))
                return
            }

            if let httpStatusCode = (response as? HTTPURLResponse)?.statusCode {
                guard (200 ... 299) ~= httpStatusCode else {
                    return completion(nil, .httpResponseError(statusCode: httpStatusCode))
                }
            }

            guard let data = data else {
                completion(nil, .invalidResponse())
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                return completion(result, nil)
            } catch { completion(nil, NetworkRequestError(error: error)) }
        }
        .resume()
    }
}
