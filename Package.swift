// swift-tools-version:5.3

// Trying to replicate this method https://forums.swift.org/t/swiftpm-binary-target-with-sub-dependencies/40197/7
// using binary targets, and using SpmTestApp to integrate (but it has errors)

import PackageDescription

let package = Package(
    name: "iProov",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "iProov",
            targets: ["iProovTargets"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "iProov",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/iProov.xcframework.zip",
            checksum: "4b31d93d459d23307d5573e27767ffbeb647c1274617461c83e70b8a6b42d6c4"
        ),
        .binaryTarget(
            name: "SocketIO",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/SocketIO.xcframework.zip",
            checksum: "ae3fa8e353494851f9e1a6351a28635e8cbd210d744413d3481ededc01582cc4"
        ),
        .binaryTarget(
            name: "Starscream",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/Starscream.xcframework.zip",
            checksum: "bfcab1c2aa13351029e2983bbe7a50ec30eb0fdc812ae611d681f6a4c2574de1"
        ),
        .target(name: "iProovTargets",
            dependencies: [
                .target(name: "iProov", condition: .when(platforms: .some([.iOS]))),
                .target(name: "SocketIO", condition: .when(platforms: .some([.iOS]))),
                .target(name: "Starscream", condition: .when(platforms: .some([.iOS])))
            ],
            path: "iProovTargets"
        )
    ],
    swiftLanguageVersions: [.v5]
)
