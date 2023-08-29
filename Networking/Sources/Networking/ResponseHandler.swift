//
//  ResponseHandler.swift
//  
//
//  Created by Abdelrhman Elmahdy on 15/08/2023.
//

import Foundation
import BtechFoundation

// Responsibilities
// 1- map status codes to errors or objects?
// 2- decode responses?

public protocol ResponseHandler {
    func handleResponse<T: Decodable>(urlResponse: URLResponse, data: Data) -> Result<T, NetworkRequestError>
}
