//
//  CheckoutSectionViewModel.swift
//
//
//  Created by Abdelrhman Elmahdy on 17/07/2023.
//

import Foundation

protocol CheckoutSectionViewModel {
    var number: Int { get }
    var title: String { get }
    var isActive: Bool { get set }

    init(number: Int, isActive: Bool)

    func didPressChange()
}
