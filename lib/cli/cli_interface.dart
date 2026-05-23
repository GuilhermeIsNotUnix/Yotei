import 'package:yotei/core/shutdown_manager.dart';

const debug = true;

class CliInterface {
    final List<String> arguments;

    CliInterface(this.arguments);

    void run() async {
        if(debug == true) {
            print('$arguments');
        }

        if(arguments.isEmpty) {
            print('yotei error: no argument passed.');
            printUsage();
            return;
        }
        
        final command = arguments.first;
        final manager = ShutdownManager();

        switch(command) {
            case 'help':
                printUsage();
                break;
            case 'status':
                break;
            case 'shutdown':
                checkTimeArgument();
                manager.scheduleShutdown(arguments[1]);
                break;
            case 'now':
                manager.shutdownNow();                    
                break;
            case 'cancel':
                manager.cancelShutdown();
                break;
            default:
                print('yotei error: No valid command was provided as an argument.');
                break;
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
            throw ArgumentError('yotei error: Missing time argument.');
        }
    }
}