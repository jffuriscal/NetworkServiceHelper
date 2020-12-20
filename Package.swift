// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkServiceHelper",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NetworkServiceHelper",
            targets: ["NetworkServiceHelper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.2.0"),
    ],
    targets: [
        .target(
            name: "NetworkServiceHelper",
            dependencies: ["Alamofire", "SwiftyJSON"]),
        .testTarget(
            name: "NetworkServiceHelperTests",
            dependencies: ["NetworkServiceHelper"]),
    ]
)
