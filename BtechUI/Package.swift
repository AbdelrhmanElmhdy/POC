// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "BtechUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "BtechUI", targets: ["BtechUI"]),
    ],
    targets: [
        .target(name: "BtechUI", dependencies: []),
        .testTarget(name: "BtechUITests", dependencies: ["BtechUI"]),
    ]
)
