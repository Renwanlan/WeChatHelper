// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeChatHelper",
    targets: [
        // Command line tool that hosts the parser logic
        .executableTarget(
            name: "WeChatHelper"),
        // Basic unit tests for the parser
        .testTarget(
            name: "WeChatHelperTests",
            dependencies: ["WeChatHelper"]),
    ]
)
