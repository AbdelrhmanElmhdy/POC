//
//  File.swift
//  
//
//  Created by Abdelrhman Elmahdy on 24/07/2023.
//

import Foundation

extension PersonalInfoSection {
    final class ViewModel: CheckoutSectionViewModel {
        let number: Int
        let title = "Personal Info"
        var isActive: Bool
        
        required init(number: Int, isActive: Bool) {
            self.number = number
            self.isActive = isActive
        }

        func didPressChange() {
            
        }
    }
}
