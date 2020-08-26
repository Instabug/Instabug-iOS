// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Instabug",
    products: [
        .library(
            name: "Instabug",
            targets: ["Instabug"])
    ],
    targets: [
        .binaryTarget(
            name: "Instabug",
            url: "https://github.com/Instabug/Instabug-iOS/releases/download/9.1.6/Instabug.xcframework.zip",
            checksum: "232af2900f579661d828ddb3ba3c469f530b3060b69729786966320fcaee3695")
    ]
)
