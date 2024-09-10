// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "GoogleMLKitSwiftPM",
  platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "MLKitBarcodeScanning",
      targets: ["MLKitBarcodeScanning", "MLImage", "MLKitVision", "Common"]),
    .library(
      name: "MLKitFaceDetection",
      targets: ["MLKitFaceDetection", "MLImage", "MLKitVision", "Common"]),
  ],
  dependencies: [
    .package(url: "https://github.com/google/promises.git", from: "2.1.1"),
    .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.2.0"),
    .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.7.1"),
    .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "3.1.1"),
    .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30909.0")),
  ],
  targets: [
    .binaryTarget(
      name: "MLImage",
      path: "GoogleMLKit/MLImage.xcframework"),
    .binaryTarget(
      name: "MLKitBarcodeScanning",
      path: "GoogleMLKit/MLKitBarcodeScanning.xcframework"),
    .binaryTarget(
      name: "MLKitCommon",
      path: "GoogleMLKit/MLKitCommon.xcframework"),
    .binaryTarget(
      name: "MLKitFaceDetection",
      path: "GoogleMLKit/MLKitFaceDetection.xcframework"),
    .binaryTarget(
      name: "MLKitVision",
      path: "GoogleMLKit/MLKitVision.xcframework"),
    .binaryTarget(
      name: "GoogleToolboxForMac",
      path: "GoogleMLKit/GoogleToolboxForMac.xcframework"),
    .binaryTarget(
      name: "GoogleUtilitiesComponents",
      path: "GoogleMLKit/GoogleUtilitiesComponents.xcframework"),
    .binaryTarget(name: "Protobuf", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/Protobuf.xcframework.zip", checksum: "e411598ad55b7a74bdec956e67fd7e6b453fcd4267c0f7ccfdfad0952a220cbd"),
    .target(
      name: "Common",
      dependencies: [
        "MLKitCommon",
        "GoogleToolboxForMac",
        "GoogleUtilitiesComponents",
        "Protobuf",
        .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
        .product(name: "GULEnvironment", package: "GoogleUtilities"),
        .product(name: "GULISASwizzler", package: "GoogleUtilities"),
        .product(name: "GULLogger", package: "GoogleUtilities"),
        .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
        .product(name: "GULNSData", package: "GoogleUtilities"),
        .product(name: "GULNetwork", package: "GoogleUtilities"),
        .product(name: "GULReachability", package: "GoogleUtilities"),
        .product(name: "GULUserDefaults", package: "GoogleUtilities"),
        .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
        .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
        .product(name: "nanopb", package: "nanopb"),
        .product(name: "FBLPromises", package: "promises"),
      ]),
  ]
)
