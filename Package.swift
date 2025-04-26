// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dozer",
    platforms: [
        .macOS(.v13), .iOS(.v16), .tvOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Dozer",
            targets: ["Dozer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/iOSBrett/Neo.git", from: "0.9.5"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Dozer",
            dependencies: ["Neo"]),
        .testTarget(
            name: "DozerTests",
            dependencies: ["Dozer", "Neo"]
        ),
    ]
)
