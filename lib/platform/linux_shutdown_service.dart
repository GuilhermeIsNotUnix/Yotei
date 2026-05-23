class LinuxShutdownService {
    Future<void> scheduleShutdown(DateTime targetTime) async {
        if(targetTime.minute < 10) {
            final minutes = targetTime.minute.toString().padLeft(2, '0');
            final process = await Process.run("shutdown", ["-h", "${targetTime.hour}:$minutes"]);

            print("Exit code: ${process.exitCode}");
            print("Output:\n${process.stdout}");

            if(process.stderr.isNotEmpty) {
                print("Errors:${process.stderr}\n");
            }
        } else {
            final process = await Process.run("shutdown", ["-h", "${targetTime.hour}:${targetTime.minute}"]);

            print("Exit code: ${process.exitCode}");
            print("Output:\n${process.stdout}");

            if(process.stderr.isNotEmpty) {
                print("Errors:${process.stderr}\n");
            }
        }
    }

    Future<void> shutdownNow(bool debugMode) async {
        if(!debugMode) {
            final process = await Process.run("shutdown", ["-h", "now"]);

            print("Exit code: ${process.exitCode}");
            print("Output:\n${process.stdout}");

            if(process.stderr.isNotEmpty) {
                print("Errors:${process.stderr}\n");
            }
        } else {
            print("yotei debug mode:\n\n Command set to be executed: shutdown -h now");
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