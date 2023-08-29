//
//  PrimaryTextField.swift
//  CheckoutAndPayment
//
//  Created by Abdelrhman Elmahdy on 30/05/2023.
//

import SwiftUI

public struct PrimaryTextField: View {
    public let placeHolder: String
    @Binding public var text: String
    @Binding public var errorMessage: String

    @State var isFocused = false
    private var isPlaceHolderShrunk: Bool { isFocused || !text.isEmpty }

    let tintColor = Color(.darkGray)
    @State private var borderColor = Color.gray

    private var placeholderFontSize: CGFloat {
        isPlaceHolderShrunk ? placeholderShrunkFontSize : placeholderOriginalFontSize
    }

    private let placeholderOriginalFontSize = 16.0
    private let placeholderShrunkFontSize = 12.0

    public var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Text(placeHolder)
                    .foregroundColor(isFocused ? tintColor : Color(.placeholderText))
                    .font(.system( size: placeholderFontSize))
                    .frame(maxHeight: .infinity, alignment: isPlaceHolderShrunk ? .top : .center)

                TextField("", text: $text, onEditingChanged: { isEditing in
                    withAnimation {
                        isFocused = isEditing
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, isPlaceHolderShrunk ? 12 : 0)
            }
            .frame(minHeight: 25)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .stroke(isFocused ? tintColor : borderColor, lineWidth: 1)
            )

            if !errorMessage.isEmpty {
                Text(errorMessage)
            }
        }
    }
}

struct PrimaryTextField_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTextField(placeHolder: "Street number & name", text: .constant(""), errorMessage: .constant(""))
            .frame(width: 400, height: 56)
    }
}
