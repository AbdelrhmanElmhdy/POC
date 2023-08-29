import BtechUI
import SwiftUI

public struct CheckoutAndPaymentView: View {
    let viewModel: ViewModel

    var sectionNumbers: [ViewModel.CheckoutSection: Int] {
        var sectionNumbers: [ViewModel.CheckoutSection: Int] = [:]

        for (index, requiredSection) in viewModel.requiredSections.enumerated() {
            sectionNumbers[requiredSection] = index + 1
        }

        return sectionNumbers
    }

    var personalInfoSection: some View {
        PersonalInfoSection(
            number: sectionNumbers[.personalInfo]!,
            isActive: viewModel.activeSection == .personalInfo
        )
    }

    var deliveryDetailsSection: some View {
        DeliveryDetailsSection(
            number: sectionNumbers[.deliveryDetails]!,
            isActive: viewModel.activeSection == .deliveryDetails
        )
    }

    var paymentInfoSection: some View {
        PaymentInfoSection(
            number: sectionNumbers[.paymentInfo]!,
            isActive: viewModel.activeSection == .paymentInfo
        )
    }

    var orderSummary: some View {
        OrderSummaryView()
    }

    public var body: some View {
        VStack(spacing: 30) {
            if viewModel.isGuestUser { personalInfoSection }
            deliveryDetailsSection
            paymentInfoSection

            DividerView()

            orderSummary

            Spacer()
        }
    }

    public init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
    }
}

struct CheckoutAndPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutAndPaymentView(viewModel: CheckoutAndPaymentView.ViewModel())
    }
}
