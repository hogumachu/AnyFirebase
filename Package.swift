// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "AnyFirebase",
  products: [
    .library(
      name: "AnyFirebase",
      targets: ["AnyFirebase"]
    ),
  ],
  targets: [
    .target(
      name: "AnyFirebase"
    ),
  ]
)
