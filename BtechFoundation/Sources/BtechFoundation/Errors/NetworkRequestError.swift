//
//  NetworkRequestError.swift
//  StarWars
//
//  Created by Abdelrhman Elmahdy on 15/03/2023.
//

import Foundation

public enum NetworkRequestError: UserFriendlyError {
    public init(error: Error) {
        if let error = error as? DecodingError {
            self = .failedToDecode(debugDescription: String(describing: error))
            return
        }

        if let error = error as? URLError {
            switch error.code {
            case .notConnectedToInternet, .networkConnectionLost, .dataNotAllowed:
                self = .failedToConnectToInternet(debugDescription: String(describing: error))
            case .timedOut:
                self = .requestTimedOut(debugDescription: String(describing: error))
            default:
                self = .somethingWentWrong(debugDescription: String(describing: error))
            }

            return
        }

        self = .somethingWentWrong(debugDescription: String(describing: error))
    }

    case somethingWentWrong(debugDescription: String,
                            userFriendlyDescription: String? = nil,
                            userFriendlyRecoverySuggestion: String? = nil,
                            isFatal: Bool = true)

    case failedToConnectToInternet(debugDescription: String = "Failed to connect to internet",
                                   userFriendlyDescription: String? = "Request timed out",
                                   userFriendlyRecoverySuggestion: String? = "Check internet connection",
                                   isFatal: Bool = false)

    case requestTimedOut(debugDescription: String = "Request timed out",
                         userFriendlyDescription: String? = "Request timed out",
                         userFriendlyRecoverySuggestion: String? = "Check internet connection",
                         isFatal: Bool = false)

    case failedToDecode(debugDescription: String,
                        userFriendlyDescription: String? = nil,
                        userFriendlyRecoverySuggestion: String? = nil,
                        isFatal: Bool = true)

    case failedToEncode(debugDescription: String,
                        userFriendlyDescription: String? = nil,
                        userFriendlyRecoverySuggestion: String? = nil,
                        isFatal: Bool = true)

    case invalidURL(debugDescription: String,
                    userFriendlyDescription: String? = nil,
                    userFriendlyRecoverySuggestion: String? = nil,
                    isFatal: Bool = true)

    case invalidResponse(debugDescription: String = "Invalid response",
                         userFriendlyDescription: String? = nil,
                         userFriendlyRecoverySuggestion: String? = nil,
                         isFatal: Bool = true)

    case badRequest(debugDescription: String = "Bad request",
                    userFriendlyDescription: String? = nil,
                    userFriendlyRecoverySuggestion: String? = nil,
                    isFatal: Bool = true)

    case httpResponseError(statusCode: Int)

    public var associatedValues: (debugDescription: String, userFriendlyDescription: String, userFriendlyRecoverySuggestion: String, isFatal: Bool) {
        switch self {
        case let .somethingWentWrong(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal),
             let .failedToConnectToInternet(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal),
             let .requestTimedOut(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal),
             let .failedToDecode(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal),
             let .failedToEncode(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal),
             let .invalidURL(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal),
             let .invalidResponse(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal),
             let .badRequest(debugDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal):
            return (debugDescription,
                    userFriendlyDescription ?? "Something went wrong",
                    userFriendlyRecoverySuggestion ?? "Try again later",
                    isFatal)

        case let .httpResponseError(statusCode):
            return getStatusCodeErrorAssociatedValues(statusCode)
        }
    }

    private func getStatusCodeErrorAssociatedValues(_ statusCode: Int)
        -> (debugDescription: String,
            userFriendlyDescription: String,
            userFriendlyRecoverySuggestion: String,
            isFatal: Bool) {
        var statusCodeDescription = "statusCode: \(statusCode) "
        var userFriendlyDescription = "Something went wrong"
        var userFriendlyRecoverySuggestion: String = "Try again later"
        var isFatal = false

        switch statusCode {
        case 401:
            statusCodeDescription += "Authentication Required"
            userFriendlyDescription = "Login required"
            userFriendlyRecoverySuggestion = "PLease login first"
        case 403:
            statusCodeDescription += "Forbidden"
            userFriendlyDescription = "PLease login first"
        case 408:
            statusCodeDescription += "Request Timeout"
            userFriendlyDescription = "Request timed out"
            userFriendlyRecoverySuggestion = "Check internet connection"
        case 400 ... 499:
            statusCodeDescription += "Bad request"
            isFatal = true
        case 500 ... 599:
            statusCodeDescription += "Server error"
        case 600:
            statusCodeDescription += "Outdated"
        default:
            statusCodeDescription += "Request failed"
        }

        return (statusCodeDescription, userFriendlyDescription, userFriendlyRecoverySuggestion, isFatal)
    }
}
