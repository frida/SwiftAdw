// swift-tools-version:5.6

import Foundation
import PackageDescription

func pkgConfigFlags(_ packages: [String], libs: Bool = false) -> [String] {
    guard let pc = findOnPath("pkg-config") else { return [] }
    let proc = Process()
    proc.executableURL = URL(fileURLWithPath: pc)
    proc.arguments = (libs ? ["--libs"] : ["--cflags"]) + packages
    let pipe = Pipe()
    proc.standardOutput = pipe
    proc.standardError = FileHandle.nullDevice
    try? proc.run()
    proc.waitUntilExit()
    guard proc.terminationStatus == 0 else { return [] }
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    return String(data: data, encoding: .utf8)?
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .split(separator: " ")
        .map(String.init) ?? []
}

func findOnPath(_ name: String) -> String? {
    #if os(Windows)
    let separator: Character = ";"
    let extensions = ["", ".exe", ".cmd", ".bat"]
    let pathSep = "\\"
    #else
    let separator: Character = ":"
    let extensions = [""]
    let pathSep = "/"
    #endif
    let env = ProcessInfo.processInfo.environment
    guard let pathValue = env["PATH"] ?? env["Path"] else { return nil }
    for dir in pathValue.split(separator: separator).map(String.init) where !dir.isEmpty {
        for ext in extensions {
            let candidate = dir + pathSep + name + ext
            if FileManager.default.fileExists(atPath: candidate) {
                return candidate
            }
        }
    }
    return nil
}

let cAdwFlags = pkgConfigFlags(["libadwaita-1"])
let cAdwLibs  = pkgConfigFlags(["libadwaita-1"], libs: true)

let package = Package(
    name: "Adw",
    products: [ .library(name: "Adw", targets: ["Adw"]) ],
    dependencies: [
        .package(url: "https://github.com/frida/gir2swift.git", branch: "development"),
        .package(url: "https://github.com/frida/SwiftGtk.git",  branch: "gtk4-development"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CAdw",
            path: "Sources/CAdw",
            sources: ["adw_bridging.c"],
            publicHeadersPath: "include",
            cSettings: [ .unsafeFlags(cAdwFlags) ],
            linkerSettings: [ .unsafeFlags(cAdwLibs) ]
        ),
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
