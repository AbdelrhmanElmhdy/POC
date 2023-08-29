//
//  Result+Ext.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation

public extension Result where Success == Void {
    /// Instead of `.success(())`
    static var success: Result { .success(()) }
}
