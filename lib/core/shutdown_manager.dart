import 'package:yotei/core/time_parser.dart';
import 'package:yotei/core/time_scheduler.dart';
import 'package:yotei/platform/platform_detector.dart';
import 'package:yotei/platform/linux_shutdown_service.dart';

const debugMode = true;

class ShutdownManager {
    Future<void> scheduleShutdown(String givenTime) async {
        final os = getOperatingSystem();
        final parsedTime = TimeParser.parseTime(givenTime);
        final targetTime = TimeScheduler.constructDateTime(parsedTime);

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.scheduleShutdown(targetTime, debugMode);

                break;
            case OperatingSystem.windows:
                //...
                
                break;
            case OperatingSystem.macOS:
                //...
                
                break;
        }
    }

    Future<void> shutdownNow() async {
        final os = getOperatingSystem();

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.shutdownNow(debugMode);

                break;
            case OperatingSystem.windows:
                //...
                
                break;
            case OperatingSystem.macOS:
                //...
                
                break;
        }
    }

    Future<void> cancelShutdown() async {
        final os = getOperatingSystem();

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.cancelShutdown(debugMode);

                break;
            case OperatingSystem.windows:
                //...
                
                break;
            case OperatingSystem.macOS:
                //...
                
                break;
        }
    }


    OperatingSystem getOperatingSystem() {
        final detector = PlatformDetector();
        final os = detector.detectOperatingSystem();

        return os;
    }
}