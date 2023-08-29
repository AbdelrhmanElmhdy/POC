//
//  PaymentInfoSectionViewModel.swift
//  
//
//  Created by Abdelrhman Elmahdy on 17/07/2023.
//

import Foundation


extension PaymentInfoSection {
    final class ViewModel: CheckoutSectionViewModel {
        let number: Int
        let title = "Payment Info"
        var isActive: Bool
        
        required init(number: Int, isActive: Bool) {
            self.number = number
            self.isActive = isActive
        }

        func didPressChange() {
            
        }
    }
}

