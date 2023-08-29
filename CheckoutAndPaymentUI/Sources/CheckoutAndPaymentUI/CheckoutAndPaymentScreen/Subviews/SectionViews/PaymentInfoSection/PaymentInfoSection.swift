//
//  PaymentInfoSection.swift
//  CheckoutAndPayment
//
//  Created by Abdelrhman Elmahdy on 28/05/2023.
//

import SwiftUI

struct PaymentInfoSection: CheckoutSectionView {
    let viewModel: ViewModel

    init(number: Int, isActive: Bool) {
        self.viewModel = ViewModel(number: number, isActive: isActive)
    }
    
    @ViewBuilder var content: some View {
        Text("Payment Info Section")
    }

    public var body: some View {
        VStack {
            header
            content
        }
    }
}

struct PaymentInfoSection_Previews: PreviewProvider {
    static var previews: some View {
        PaymentInfoSection(number: 1, isActive: true)
    }
}
