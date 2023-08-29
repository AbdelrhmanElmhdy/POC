import BtechFoundation
import CheckoutAndPayment
import Combine

public extension CheckoutAndPaymentView {
    final class ViewModel {
        @Published var cities: [City] = []

        enum CheckoutSection {
            case personalInfo, deliveryDetails, paymentInfo
        }

        var isGuestUser: Bool

        @Published var activeSection: CheckoutSection!

        var requiredSections: [CheckoutSection] {
            return isGuestUser
                ? [.personalInfo, .deliveryDetails, .paymentInfo]
                : [.deliveryDetails, .paymentInfo]
        }

        public init(isGuestUser: Bool = true) {
            self.isGuestUser = isGuestUser
            activeSection = requiredSections[0]
        }

        // MARK: Life Cycle

        func didAppear() async {
            let result = await GetCitiesUseCase.getCities()

            switch result {
            case let .success(cities):
                self.cities = cities
            case let .failure(error):
                didReceiveError(error)
            }
        }

        // MARK: Actions

        func didPressChangePersonalInfo() {
            activeSection = .personalInfo
        }

        func didPressChangeDeliveryDetails() {
            activeSection = .deliveryDetails
        }

        func didPressChangePaymentInfo() {
            activeSection = .paymentInfo
        }

        private func didReceiveError(_ error: Error) {
        }
    }
}
