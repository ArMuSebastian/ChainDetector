// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChainDetector",
    products:
        [
            .library(
                name: "ChainDetector",
                targets:
                    [
                        "ChainDetector"
                    ]
            ),
        ],
    dependencies:
        [
            .package(
                name: "MathKit",
                url: "https://gitlab.com/ArMuSebastian/MathKit",
                .branch("master")
            ),
        ],
    targets:
        [
            .target(
                name: "ChainDetectorCore"
            ),
            .target(
                name: "ChainDetector",
                dependencies:
                    [
                        "ChainDetectorCore",
                    ]
            ),
            .testTarget(
                name: "ChainDetectorTests",
                dependencies:
                    [
                        "MathKit",
                        "ChainDetector"
                    ]
            ),
        ]
)
