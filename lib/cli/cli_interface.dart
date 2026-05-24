import 'package:yotei/core/shutdown_manager.dart';

const debugMode = false;

class CliInterface {
    final List<String> arguments;

    CliInterface(this.arguments);

    Future<void> run() async {
        if(debugMode) {
            print('$arguments');
        }

        if(arguments.isEmpty) {
            print('yotei error: no arguments passed.\n');
            printUsage();
            return;
        }
        
        final command = arguments.first;
        final manager = ShutdownManager();

        try {
            switch(command) {
                case 'help':
                    printUsage();
                    break;
                case 'status':
                    break;
                case 'shutdown':
                    checkTimeArgument();
                    final targetTime = await manager.scheduleShutdown(arguments[1], debugMode);
                    final hours = targetTime.hour.toString().padLeft(2, '0');
                    final minutes = targetTime.minute.toString().padLeft(2, '0');
                    
                    print("yotei: Scheduled to shut down at $hours:$minutes...");
                    break;
                case 'now':
                    await manager.shutdownNow(debugMode);
                    print("yotei: Shutting down now...");
                    break;
                case 'cancel':
                    await manager.cancelShutdown(debugMode);
                    print("yotei: Any scheduled shutdown have been canceled.");
                    break;
                default:
                    print('yotei error: No valid command was provided as an argument.');
                    break;
            }
        } catch(e) {
            print("yotei error: $e");
        }
    }

    void printUsage() {
        print('yotei shutdown HH:MM');
        print('\tSchedule the system to shut down at the time HH:MM specified as an argument.');
        print('yotei now');
        print('\tA signal is sent to shut down the system now.');
        print('yotei status');
        print('\tShows whether any appointments have been scheduled.');
        print('yotei cancel');
        print('\tCancel any previously scheduled shutdowns.');
        print('yotei help');
        print('\tShows Yotei\'s usage and features.');
    }

    void checkTimeArgument() {
        if(arguments.length <= 1) {
            throw ArgumentError('Missing time argument.');
        }
    }
}