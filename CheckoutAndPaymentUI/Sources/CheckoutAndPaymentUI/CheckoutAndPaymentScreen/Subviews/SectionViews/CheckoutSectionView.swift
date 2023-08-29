//
//  CheckoutSectionView.swift
//  CheckoutAndPayment
//
//  Created by Abdelrhman Elmahdy on 28/05/2023.
//

import SwiftUI

protocol CheckoutSectionView: View {
    associatedtype ViewModel: CheckoutSectionViewModel

    var viewModel: ViewModel { get }
    @ViewBuilder var header: CheckoutSectionHeader { get }
}

extension CheckoutSectionView {
    var header: CheckoutSectionHeader {
        CheckoutSectionHeader(number: viewModel.number, title: viewModel.title, didPressChange: viewModel.didPressChange)
    }
}
