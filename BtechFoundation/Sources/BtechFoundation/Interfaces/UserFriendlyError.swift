//
//  UserFriendlyError.swift
//
//
//  Created by Abdelrhman Elmahdy on 31/07/2023.
//

import Foundation

/// An error that can be used to present a user friendly error message to the user and some advice, while retaining the
/// developer friendly description.
public protocol UserFriendlyError: Error, CustomNSError {
    var debugDescription: String { get }
    var userFriendlyDescription: String { get }
    var userFriendlyRecoverySuggestion: String { get }
    var isFatal: Bool { get }

    var defaultUserFriendlyDescription: String { get }
    var defaultUserFriendlyRecoverySuggestion: String { get }

    var associatedValues: (debugDescription: String, userFriendlyDescription: String, userFriendlyRecoverySuggestion: String, isFatal: Bool) { get }
}

public extension UserFriendlyError {
    var debugDescription: String {
        "Error: " + associatedValues.debugDescription + "\n" + Thread.callStackSymbols.joined(separator: "\n")
    }

    var userFriendlyDescription: String {
        associatedValues.userFriendlyDescription
    }

    var userFriendlyRecoverySuggestion: String {
        associatedValues.userFriendlyRecoverySuggestion
    }

    var isFatal: Bool {
        associatedValues.isFatal
    }

    var defaultUserFriendlyDescription: String {
        "Something went wrong"
    }

    var defaultUserFriendlyRecoverySuggestion: String {
        "Try again later"
    }
}

// MARK: - Error User Info

public extension UserFriendlyError {
    var errorUserInfo: [String: Any] {
        var userInfo: [String: Any] = [:]
        userInfo[NSLocalizedDescriptionKey] = debugDescription
        return userInfo
    }
}
