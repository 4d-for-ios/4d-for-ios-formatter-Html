// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "formatter-html",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "___PRODUCT___", targets: ["___PRODUCT___"])
    ],
    targets: [
        .target(name: "___PRODUCT___", path: "Sources"),
        .testTarget(name: "Tests", dependencies: ["___PRODUCT___"], path: "Tests")
    ]
)
