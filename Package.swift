// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Adw",
    products: [ .library(name: "Adw", targets: ["Adw"]) ],
    dependencies: [
        .package(url: "https://github.com/frida/gir2swift.git", branch: "development"),
        .package(url: "https://github.com/frida/SwiftGtk.git",  branch: "gtk4-development"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .systemLibrary(name: "CAdw", pkgConfig: "libadwaita-1",
            providers: [
                .brew(["libadwaita", "gtk4", "glib", "gobject-introspection"]),
                .apt(["libadwaita-1-dev", "libgtk-4-dev", "libglib2.0-dev", "gobject-introspection", "libgirepository1.0-dev"])
            ]),
        .target(
            name: "Adw",
            dependencies: [
                "CAdw",
                .product(name: "gir2swift", package: "gir2swift"),
                .product(name: "Gtk",       package: "SwiftGtk"),
            ],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"], .when(configuration: .release)),
                .unsafeFlags(["-suppress-warnings", "-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug)),
            ],
            plugins: [
                .plugin(name: "gir2swift-plugin", package: "gir2swift")
            ]
        ),
        .testTarget(
            name: "AdwTests",
            dependencies: ["Adw"],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"], .when(configuration: .release)),
            ]
        ),
    ]
)
