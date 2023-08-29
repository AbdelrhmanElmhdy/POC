//
//  CheckoutSectionHeader.swift
//
//
//  Created by Abdelrhman Elmahdy on 09/07/2023.
//

import SwiftUI

struct CheckoutSectionHeader: View {
    var number: Int
    var title: String
    var didPressChange: () -> Void

    var body: some View {
        HStack {
            circularNumberView(number)
                .padding(.trailing, 12.0)

            Text(title)
                .font(.system(size: 18, weight: .semibold))

            Spacer()

            Button(action: didPressChange) {
                Text("Change")
            }
        }
        .padding(16)
    }

    private func circularNumberView(_ number: Int) -> some View {
        Text("\(number)")
            .font(.system(size: 16))
            .frame(width: 32, height: 32)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color(.label), lineWidth: 2)
            )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSectionHeader(number: 1, title: "Test", didPressChange: { })
    }
}
