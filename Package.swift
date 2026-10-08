// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Adfurikun-SPM-Five",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AdfurikunFive", targets: ["AdfurikunFive"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Core.git",
            exact: "4.5.0-alpha.1"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "FiveAd",
            url: "https://github.com/ly-ads-network/swift-package-manager-fivead/releases/download/3.1.1/FiveAd-3.1.1.xcframework.zip",
            checksum: "ec342d8aa93964073b61bf12cf462214409ca8ce0257213e79bce885da37014b"
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
