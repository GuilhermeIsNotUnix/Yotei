import 'dart:io';

enum OperatingSystem {
    linux,
    windows,
    macOS,
}

class PlatformDetector {
    OperatingSystem detectOperatingSystem() {
        if (Platform.isLinux) {
            return OperatingSystem.linux;
        } else if (Platform.isWindows) {
            return OperatingSystem.windows;
        } else if (Platform.isMacOS) {
            return OperatingSystem.macOS;
        } else {
            throw UnsupportedError('Platform not supported.');
        }
    }
}