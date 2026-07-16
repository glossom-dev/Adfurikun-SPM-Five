// swift-tools-version: 6.0
import PackageDescription

let releaseVersion = "4.4.000"

let package = Package(
    name: "Adfurikun-SPM-Five",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AdfurikunFive", targets: ["AdfurikunFive"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Core.git",
            exact: "4.4.000"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "FiveAd",
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Five/releases/download/\(releaseVersion)/FiveAd.xcframework.zip",
            checksum: "f813a3fb468f5478cf6f2fd109d0abcc73e0f888015e6d78e585071d41a4bd0a"
        ),
        .target(
            name: "AdfurikunFive",
            dependencies: [
                .product(name: "AdfurikunSDK", package: "Adfurikun-SPM-Core"),
                "FiveAd"
            ],
            path: "Sources",
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Network"),
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("WebKit"),
            ]
        )
    ]
)
