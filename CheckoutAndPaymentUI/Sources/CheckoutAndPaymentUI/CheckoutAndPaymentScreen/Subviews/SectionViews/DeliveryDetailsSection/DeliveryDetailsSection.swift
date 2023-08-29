//
//  DeliveryDetailsSection.swift
//  CheckoutAndPayment
//
//  Created by Abdelrhman Elmahdy on 28/05/2023.
//

import SwiftUI

public struct DeliveryDetailsSection: CheckoutSectionView {
    let viewModel: ViewModel

    init(number: Int, isActive: Bool) {
        viewModel = ViewModel(number: number, isActive: isActive)
    }

    @ViewBuilder var content: some View {
        Text("Delivery Details Section")
    }

    public var body: some View {
        VStack {
            header
            content
        }
    }
}

struct DeliveryDetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsSection(number: 1, isActive: true)
    }
}
