//
//  DividerView.swift
//  
//
//  Created by Abdelrhman Elmahdy on 16/07/2023.
//

import SwiftUI

public struct DividerView: View {
    public init() {}

    public var body: some View {
        Divider()
            .frame(height: 18)
            .overlay(Color(UIColor.systemGray6))
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
