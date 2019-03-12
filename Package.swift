// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyCache",
    products: [
        .library(name: "SwiftyCache", targets: ["SwiftyCache"]),
    ],
    targets: [
        .target(name: "SwiftyCache", dependencies: []),
        .testTarget(name: "SwiftyCacheTests", dependencies: ["SwiftyCache"]),
    ]
)
