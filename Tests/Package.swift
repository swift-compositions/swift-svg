// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "testing",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    dependencies: [
        .package(path: ".."),
        .package(url: "https://github.com/swift-compositions/swift-test-application.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-svg-render.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-test.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-tests.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-spatial.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "SVG Test Support",
            dependencies: [
                .product(name: "SVG", package: "swift-svg"),
                .product(name: "Test Application", package: "swift-test-application"),
                .product(name: "SVG Rendering", package: "swift-svg-render"),
                .product(name: "Test", package: "swift-test"),
                .product(
                    name: "Space Test Support",
                    package: "swift-spatial"
                ),
            ],
            path: "Support"
        ),
        .testTarget(
            name: "SVG Snapshot Tests",
            dependencies: [
                "SVG Test Support",
                .product(name: "Test Application", package: "swift-test-application"),
                .product(name: "Tests Inline Snapshot", package: "swift-tests"),
            ],
            path: "SVG Snapshot Tests"
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
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem
}
