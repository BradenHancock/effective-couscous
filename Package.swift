// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "iProov",
    products: [
        .library(
            name: "iProov",
            type: .dynamic,
            targets: ["iProovWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift", .upToNextMinor(from: "16.0.1"))
    ],
    targets: [
        .binaryTarget(
            name: "iProov",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/iProov.xcframework.zip",
            checksum: "a37807600b6fa386bf42388cc4f43c84f2fb67a84e884dd4ec5667d0dba33430"
        ),
        .target(name: "iProovWrapper",
            dependencies: [
                .product(name: "SocketIO", package: "socket.io-client-swift")
            ],
            path: "./SwiftPM"
        )
    ]
)
