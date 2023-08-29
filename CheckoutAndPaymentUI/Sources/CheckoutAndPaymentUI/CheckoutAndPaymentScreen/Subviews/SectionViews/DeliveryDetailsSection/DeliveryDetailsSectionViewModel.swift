//
//  DeliveryDetailsSectionViewModel.swift
//
//
//  Created by Abdelrhman Elmahdy on 17/07/2023.
//

import BtechFoundation
import CheckoutAndPayment
import Combine
import Foundation

extension DeliveryDetailsSection {
    final class ViewModel: CheckoutSectionViewModel {
        let number: Int
        let title = "Delivery Details"
        var isActive: Bool

        @Published var selectedCity: City?
        @Published var selectedArea: Area?
        @Published var streetNameAndNumber: String = ""
        @Published var streetNameAndNumberError: String = ""
        @Published var addressLabel: String = ""
        @Published var addressLabelError: String = ""

        @Published var savedAddresses: [DeliveryAddress] = []

        private var streetNameAndNumberSubscription: AnyCancellable?
        private var addressLabelSubscription: AnyCancellable?

        required init(number: Int, isActive: Bool) {
            self.number = number
            self.isActive = isActive
        }

        func setupFieldValidationChecks() {
            streetNameAndNumberSubscription = $streetNameAndNumber
                .debounce(for: 1, scheduler: DispatchQueue.main)
                .sink { self.validateStreetAndNumberFiled($0) }

            addressLabelSubscription = $addressLabel
                .debounce(for: 1, scheduler: DispatchQueue.main)
                .sink { self.validateAddressLabel($0) }
        }

        func validateStreetAndNumberFiled(_ streetAndNumberFiled: String) {
        }

        func validateAddressLabel(_ addressLabel: String) {
        }

        // MARK: Actions

        func didPressChange() {
        }

        func didPressContinue() {
        }

        func didSelectCity() {
        }

        func didSelectArea() async {
            guard let selectedArea = selectedArea else { return }

            let savedAddressesResult = await GetSavedAddressesUseCase.getAllSavedAddresses(in: selectedArea)
            let omsResult = await CheckStockUseCase.areCartProductsInStock(cartID: UUID(), in: selectedArea)

            switch savedAddressesResult {
            case let .success(savedAddresses):
                self.savedAddresses = savedAddresses
            case let .failure(error):
                handleError(error)
            }

            switch omsResult {
            case let .success(isInStock):
                print(isInStock)
            case let .failure(error):
                print(error)
//                handleError(error)
            }
        }

        private func handleError(_ error: UserFriendlyError) {
        }
    }
}
