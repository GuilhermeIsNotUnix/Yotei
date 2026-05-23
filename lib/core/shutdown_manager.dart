import 'package:yotei/core/time_parser.dart';
import 'package:yotei/core/time_scheduler.dart';
import 'package:yotei/platform/platform_detector.dart';
import 'package:yotei/platform/linux_shutdown_service.dart';

class ShutdownManager {
    Future<void> scheduleShutdown(String givenTime) {
        final os = getOperatingSystem();
        final parsedTime = TimeParser.parseTime(givenTime);
        final targetTime = TimeScheduler.constructDateTime(parsedTime);

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.scheduleShutdown(targetTime);

                break;
            case OperatingSystem.windows:
                //...
                
                break;
            case OperatingSystem.macOS:
                //...
                
                break;
        }
    }

    Future<void> shutdownNow() {
        final os = getOperatingSystem();

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.shutdownNow();

                break;
            case OperatingSystem.windows:
                //...
                
                break;
            case OperatingSystem.macOS:
                //...
                
                break;
        }
    }

    Future<void> cancelShutdown() {
        final os = getOperatingSystem();

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.cancelShutdown();

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