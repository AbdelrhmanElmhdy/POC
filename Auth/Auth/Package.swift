// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Auth",
    products: [
        .library(name: "AuthCoordinator", targets: ["AuthCoordinator"]),
    ],
    dependencies: [
        .package(name: "AuthPresentation", path: "../AuthPresentation"),
        .package(name: "AuthDomain", path: "../AuthDomain"),
        .package(name: "AuthData", path: "../AuthData"),
    ],
    targets: [
        .target(name: "AuthCoordinator", dependencies: ["AuthPresentation", "AuthDomain", "AuthData"]),
        .testTarget(name: "AuthTests", dependencies: ["AuthCoordinator"]),
    ]
)
