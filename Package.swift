// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "iProov",
    platforms: [.iOS(.v14)],
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
            url: "https://github.com/BradenHancock/spm-test/raw/main/iProov.xcframework.zip",
            checksum: "bff20f5281b89e407efd988e5435f45c9029a49b926409ab8c7170499ef0077b"
        ),
    ]
)
