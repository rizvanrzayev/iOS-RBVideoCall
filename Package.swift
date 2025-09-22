// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArkVideoCall",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ArkVideoCall",
            targets: ["ArkVideoCall", "JitsiMeetSDK", "WebRTC", "hermes"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Giphy/giphy-ios-sdk", exact: "2.2.16")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ArkVideoCall",
            dependencies: [
                .product(name: "GiphyUISDK", package: "giphy-ios-sdk")
            ]),
        .testTarget(
            name: "ArkVideoCallTests",
            dependencies: ["ArkVideoCall"]),
        .binaryTarget(name: "JitsiMeetSDK", path: "artifacts/JitsiMeetSDK.xcframework"),
        .binaryTarget(name: "WebRTC", path: "artifacts/WebRTC.xcframework"),
        // .binaryTarget(name: "GiphyUISDK", path: "artifacts/GiphyUISDK.xcframework"),
        .binaryTarget(name: "hermes", path: "artifacts/hermes.xcframework"),
    ]
)
