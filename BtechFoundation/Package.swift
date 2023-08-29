// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "BtechFoundation",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "BtechFoundation", targets: ["BtechFoundation"]),
    ],
    targets: [
        .target(name: "BtechFoundation", dependencies: []),
        .testTarget(name: "BtechFoundationTests", dependencies: ["BtechFoundation"]),
    ]
)
