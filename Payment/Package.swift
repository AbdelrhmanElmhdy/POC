// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Payment",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "Payment", targets: ["Payment"]),
    ],
    dependencies: [
        .package(name: "BtechFoundation", path: "../BtechFoundation")
    ],
    targets: [
        .target(name: "Payment", dependencies: ["BtechFoundation"]),
        .testTarget(name: "PaymentTests", dependencies: ["Payment"]),
    ]
)
