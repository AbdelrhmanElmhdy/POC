// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CheckoutAndPaymentUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "CheckoutAndPaymentUI", targets: ["CheckoutAndPaymentUI"]),
    ],
    dependencies: [
        .package(name: "BtechUI", path: "../BtechUI"),
        .package(name: "BtechFoundation", path: "../BtechFoundation"),
        .package(name: "CheckoutAndPayment", path: "../CheckoutAndPayment"),
    ],
    targets: [
        .target(name: "CheckoutAndPaymentUI", dependencies: ["BtechUI", "CheckoutAndPayment", "BtechFoundation"]),
        .testTarget(name: "CheckoutAndPaymentUITests", dependencies: ["CheckoutAndPaymentUI"]),
    ]
)
