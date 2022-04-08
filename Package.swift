// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "iProov",
    products: [
        .library(
            name: "iProov",
            targets: ["iProov"]
        ),
        .library(
            name: "SocketIO",
            type: .dynamic,
            targets: ["SocketIO"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream", .upToNextMinor(from: "3.1.0")),
    ],
    targets: [
        .target(
            name: "SocketIO",
            dependencies: ["Starscream"]
        ),
        .binaryTarget(
            name: "iProov",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/iProov.xcframework.zip",
            checksum: "a37807600b6fa386bf42388cc4f43c84f2fb67a84e884dd4ec5667d0dba33430"
        ),
    ]
)
