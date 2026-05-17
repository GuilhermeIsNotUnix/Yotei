class CliInterface {
    final List<String> arguments;

    CliInterface(this.arguments);

    void run() {
        if(arguments.isEmpty) {
            print('yotei error: no argument passed.');
            printUsage();
        } else {
            final command = arguments.first;

            switch(command) {
                case 'help':
                    printUsage();
                    break;
                case 'status':
                    break;
                case 'shutdown':
                    break;
                case 'cancel':
                    break;
                default:
                    print('yotei error: No valid command was provided as an argument.');
                    break;
            }
        }
    }

    void printUsage() {
        print('yotei shutdown HH:MM');
        print('\tSchedule the system to shut down at the time HH:MM specified as an argument.');
        print('yotei status');
        print('\tShows whether any appointments have been scheduled.');
        print('yotei cancel');
        print('\tCancel any previously scheduled shutdowns.');
        print('yotei help');
        print('\tShows Yotei\'s usage and features.');
    }

    void detectOS() {
        // Chama código de platform/ que de fato irá detectar o OS (não faz a detecção em si)
    }

    void shutdown(int seconds) {
        // Chama código de platform/ que de fato irá desligar o OS (não faz o desligamento em si)
    }
}