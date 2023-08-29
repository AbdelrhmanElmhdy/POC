// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CheckoutAndPayment",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "CheckoutAndPayment", targets: ["CheckoutAndPayment"]),
    ],
    dependencies: [
        .package(name: "BtechFoundation", path: "../BtechFoundation"),
        .package(name: "Networking", path: "../Networking"),
    ],
    targets: [
        .target(name: "CheckoutAndPayment", dependencies: ["BtechFoundation", "Networking"]),
        .testTarget(name: "CheckoutAndPaymentTests", dependencies: ["CheckoutAndPayment"]),
    ]
)
