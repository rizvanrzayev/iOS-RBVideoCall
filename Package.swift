// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArkVideoCall",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ArkVideoCall",
            targets: ["ArkVideoCall"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jitsi/jitsi-meet-ios-sdk-releases.git", exact: "11.5.1")
    ],
    targets: [
        .target(
            name: "ArkVideoCall",
            dependencies: [
                .product(name: "JitsiMeetSDK", package: "jitsi-meet-ios-sdk-releases")
            ]),
        .testTarget(
            name: "ArkVideoCallTests",
            dependencies: ["ArkVideoCall"]),
    ]
)
