// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-svg",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "SVG", targets: ["SVG"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-compositions/swift-svg-render.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-space.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "SVG",
            dependencies: [
                .product(name: "SVG Rendering", package: "swift-svg-render")
            ]
        ),
        .testTarget(
            name: "SVG Tests",
            dependencies: [
                .target(name: "SVG"),
                .product(
                    name: "Space Test Support",
                    package: "swift-space"
                ),
            ],

            path: "Tests/SVG Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
