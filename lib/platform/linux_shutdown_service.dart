import 'dart:io';

class LinuxShutdownService {
    Future<void> scheduleShutdown(DateTime targetTime) async {
        final hours = targetTime.hour.toString().padLeft(2, '0');
        final minutes = targetTime.minute.toString().padLeft(2, '0');
        
        final process = await Process.run("shutdown", ["-h", "$hours:$minutes"]);

        print("Exit code: ${process.exitCode}");
        print("Output:\n${process.stdout}");

        if(process.stderr.isNotEmpty) {
            print("Errors:${process.stderr}\n");
        }
    }

    Future<void> shutdownNow(bool debugMode) async {
        if(debugMode) {
            print("yotei debug mode:\n\n Command set to be executed: shutdown -h now");
            return;
        }

        final process = await Process.run("shutdown", ["-h", "now"]);

        print("Exit code: ${process.exitCode}");
        print("Output:\n${process.stdout}");

        if(process.stderr.isNotEmpty) {
            print("Errors:${process.stderr}\n");
        }
    }

    Future<void> cancelShutdown(bool debugMode) async {
        if(debugMode) {
            print("yotei debug mode:\n\n Command set to be executed: shutdown -c");
            return;
        }

        final process = await Process.run("shutdown", ["-c"]);

        print("Exit code: ${process.exitCode}");
        print("Output:\n${process.stdout}");

        if(process.stderr.isNotEmpty) {
            print("Errors:${process.stderr}\n");
        }
    }

    Future<void> testEchoCommand(String message) async {
        final process = await Process.run("echo", [message]);

        print("Exit code: ${process.exitCode}");
        print("Output:\n${process.stdout}");

        if(process.stderr.isNotEmpty) {
            print("Errors:${process.stderr}\n");
        }
    }
}