import 'dart:io';

class LinuxShutdownService {
    Future<void> scheduleShutdown(DateTime targetTime, bool debugMode) async {
        final hours = targetTime.hour.toString().padLeft(2, '0');
        final minutes = targetTime.minute.toString().padLeft(2, '0');
        
        final process = await Process.run("shutdown", ["-h", "$hours:$minutes"]);

        if(process.exitCode != 0) {
            throw Exception("${process.stderr}");
        }

        if(debugMode) {
            print("Exit Code: ${process.exitCode}");
            print("Output: ${process.stdout}");
            print("Errors/Warnings: ${process.stderr}");
        }
    }

    Future<void> shutdownNow(bool debugMode) async {
        final process = await Process.run("shutdown", ["-h", "now"]);

        if(process.exitCode != 0) {
            throw Exception("${process.stderr}");
        }

        if(debugMode) {
            print("Exit Code: ${process.exitCode}");
            print("Output: ${process.stdout}");
            print("Errors/Warnings: ${process.stderr}");
        }
    }

    Future<void> cancelShutdown(bool debugMode) async {
        final process = await Process.run("shutdown", ["-c"]);

        if(process.exitCode != 0) {
            throw Exception("${process.stderr}");
        }

        if(debugMode) {
            print("Exit Code: ${process.exitCode}");
            print("Output: ${process.stdout}");
            print("Errors/Warnings: ${process.stderr}");
        }
    }

    Future<void> testEchoCommand(String message, bool debugMode) async {
        final process = await Process.run("echo", [message]);

        if(process.exitCode != 0) {
            throw Exception("${process.stderr}");
        }

        if(debugMode) {
            print("Exit Code: ${process.exitCode}");
            print("Output: ${process.stdout}");
            print("Errors/Warnings: ${process.stderr}");
        }
    }
}