import 'dart:io';
import 'package:yotei/core/time_scheduler.dart'; 

class WindowsShutdownService {
    Future<void> scheduleShutdown(DateTime targetTime, bool debugMode) async {
        final duration = TimeScheduler.calculateRemainingTime(targetTime).inSeconds;      
        final process = await Process.run("shutdown", ["/s", "/t", "$duration"]);

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
        final process = await Process.run("shutdown", ["/s", "/t", "0"]);

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
        final process = await Process.run("shutdown", ["/a"]);

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