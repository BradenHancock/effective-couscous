// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "iProov",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "iProov",
            type: .dynamic,
            targets: ["iProovTargets"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "iProov",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/iProov.xcframework.zip",
            checksum: "a37807600b6fa386bf42388cc4f43c84f2fb67a84e884dd4ec5667d0dba33430"
        ),
        .binaryTarget(
            name: "SocketIO",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/SocketIO.xcframework.zip",
            checksum: "da0534a872cfc646c8e2d4269d53466796aaee412be0526e17a4ddfa4d8902ab"
        ),
        .target(name: "iProovTargets",
            dependencies: [
                .target(name: "iProov", condition: .when(platforms: .some([.iOS]))),
                .target(name: "SocketIO", condition: .when(platforms: .some([.iOS])))
            ],
            path: "iProovTargets"
        )
    ],
    swiftLanguageVersions: [.v5]
)
