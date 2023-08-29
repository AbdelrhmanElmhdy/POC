//
//  PersonalInfoSection.swift
//  
//
//  Created by Abdelrhman Elmahdy on 16/07/2023.
//

import SwiftUI

struct PersonalInfoSection: CheckoutSectionView {
    let viewModel: ViewModel

    init(number: Int, isActive: Bool) {
        self.viewModel = ViewModel(number: number, isActive: isActive)
    }
    
    @ViewBuilder var content: some View {
        Text("Personal Info Section")
    }

    public var body: some View {
        VStack {
            header
            content
        }
    }
}

struct PersonalInfoSection_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoSection(number: 1, isActive: true)
    }
}
