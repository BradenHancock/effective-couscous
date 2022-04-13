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
            checksum: "628c602223c9f0d6185a7d326644b4e6be4fa6cbd4b4ac32605feabd97485bd1"
        ),
        .binaryTarget(
            name: "Starscream",
            url: "https://github.com/BradenHancock/effective-couscous/raw/main/Starscream.xcframework.zip",
            checksum: "f6e504c46895f4cb86877976cc70ace0d8f19cc65af9c0d13b107b05c9c98b8d"
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
