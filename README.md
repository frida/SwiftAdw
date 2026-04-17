# SwiftAdw

A Swift wrapper around [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/),
largely auto-generated from gobject-introspection via
[gir2swift](https://github.com/frida/gir2swift). This package layers
Adwaita widgets on top of [SwiftGtk](https://github.com/frida/SwiftGtk).

## Requirements

- Swift 5.6+
- libadwaita ≥ 1.9 with introspection
- GTK 4 with introspection
- `gobject-introspection` (g-ir-compiler, g-ir-scanner)

### macOS

```sh
brew install libadwaita gtk4 gobject-introspection
```

### Linux (Debian/Ubuntu)

```sh
sudo apt install libadwaita-1-dev gir1.2-adw-1 \
    libgtk-4-dev libglib2.0-dev gobject-introspection \
    libgirepository1.0-dev
```

## Usage

```swift
.package(url: "https://github.com/frida/SwiftAdw.git", branch: "development"),
```

Then depend on the `Adw` product:

```swift
.product(name: "Adw", package: "SwiftAdw")
```

## Code generation

The Swift bindings are generated at build time by the
`gir2swift-plugin`. Configuration lives in the module-config files at
the package root (`Adw-1.preamble`, `Adw-1.blacklist`, `Adw-1.verbatim`,
`Adw-1.sed`, `Adw-1.callbackSuffixes`, `Adw-1.override`).
