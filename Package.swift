// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "AnyFirebase",
  platforms: [.iOS(.v15), .macCatalyst(.v15), .macOS(.v10_15), .tvOS(.v15), .watchOS(.v7)],
  products: [
    .library(
      name: "AnyFirebase",
      targets: ["AnyFirebase"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "12.4.0"),
  ],
  targets: [
    .target(
      name: "AnyFirebase",
      dependencies: [
        .product(name: "FirebaseFunctions", package: "firebase-ios-sdk"),
      ]
    ),
  ]
)
