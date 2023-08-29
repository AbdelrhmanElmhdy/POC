// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "BtechData",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "BtechData", targets: ["BtechData"]),
    ],
    dependencies: [
        .package(name: "BtechFoundation", path: "../BtechFoundation"),
        .package(name: "Networking", path: "../Networking"),
    ],
    targets: [
        .target(name: "BtechData", dependencies: ["BtechFoundation", "Networking"]),
        .testTarget(name: "BtechDataTests", dependencies: ["BtechData"]),
    ]
)
