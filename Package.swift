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
            checksum: "46493c241d543954a58c519ef5cdd675310f37bc81f98506ffe033c2597f8fe8"
        ),
        .binaryTarget(
            name: "Starscream",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/Starscream.xcframework.zip",
            checksum: "321e6b5833c57a945bcfd35209d2369227045f9e3ae40a83023f1a152d037723"
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
