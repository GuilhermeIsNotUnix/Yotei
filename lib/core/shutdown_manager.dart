import 'package:yotei/core/time_parser.dart';
import 'package:yotei/core/time_scheduler.dart';
import 'package:yotei/platform/platform_detector.dart';
import 'package:yotei/platform/linux_shutdown_service.dart';
import 'package:yotei/platform/windows_shutdown_service.dart';

class ShutdownManager {
    Future<DateTime> scheduleShutdown(String givenTime, bool debugMode) async {
        final os = getOperatingSystem();
        final parsedTime = TimeParser.parseTime(givenTime);
        final targetTime = TimeScheduler.constructDateTime(parsedTime);

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.scheduleShutdown(targetTime, debugMode);
                
                break;
            case OperatingSystem.windows:
                final service = WindowsShutdownService();
                await service.scheduleShutdown(targetTime, debugMode);
                
                break;
            case OperatingSystem.macOS:
                final service = MacOSShutdownService();
                await service.scheduleShutdown(targetTime, debugMode);
                
                break;
        }

        return targetTime;
    }

    Future<void> shutdownNow(bool debugMode) async {
        final os = getOperatingSystem();

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.shutdownNow(debugMode);

                break;
            case OperatingSystem.windows:
                final service = WindowsShutdownService();
                await service.shutdownNow(debugMode);
                
                break;
            case OperatingSystem.macOS:
                final service = MacOSShutdownService();
                await service.shutdownNow(debugMode);
                
                break;
        }
    }

    Future<void> cancelShutdown(bool debugMode) async {
        final os = getOperatingSystem();

        switch(os) {
            case OperatingSystem.linux:
                final service = LinuxShutdownService();
                await service.cancelShutdown(debugMode);

                break;
            case OperatingSystem.windows:
                final service = WindowsShutdownService();
                await service.cancelShutdown(debugMode);
                
                break;
            case OperatingSystem.macOS:
                final service = MacOSShutdownService();
                await service.cancelShutdown(debugMode);
                
                break;
        }
    }


    OperatingSystem getOperatingSystem() {
        final detector = PlatformDetector();
        final os = detector.detectOperatingSystem();

        return os;
    }
}