//
//  ResponseHandler.swift
//
//
//  Created by Abdelrhman Elmahdy on 15/08/2023.
//

import BtechFoundation
import Foundation
import Networking

// Decoding
// Delegating to the error handler

struct NetworkResponseHandler: ResponseHandler {
    func handleResponse<T: Decodable>(urlResponse: URLResponse, data: Data) -> Result<T, NetworkRequestError> {
        if let httpStatusCode = (urlResponse as? HTTPURLResponse)?.statusCode {
            guard (200 ... 299) ~= httpStatusCode else {
                return .failure(.httpResponseError(statusCode: httpStatusCode))
            }
        }

        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedResponse)
        } catch { return .failure(NetworkRequestError(error: error)) }
    }
}


// Map each status code to its respective error
// Handle generic errors

struct ErrorHandler {
    func handleError() {
        
    }
}
