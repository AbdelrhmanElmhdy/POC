//
//  BtechApp.swift
//  Btech
//
//  Created by Abdelrhman Elmahdy on 16/07/2023.
//

import BtechData
import CheckoutAndPayment
import SwiftUI
import Networking

@main
struct BtechApp: App {
    let appConfig = AppConfig()

    init() {
        setupDependencies(with: appConfig)
        let nm = NetworkManager()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    private func setupDependencies(with appConfig: AppConfig) {
        CheckoutAndPayment.setup(with: appConfig)
        BtechData.setup(with: appConfig)
    }
}
