class CliInterface {
    final List<String> arguments;

    CliInterface(this.arguments);

    void run() {
        if(arguments.isEmpty || arguments.first == "help") {
            printUsage();
        } else {
            detectOS();
        }
    }

    void printUsage() {
        print('yotei error: no argument passed.');
        print('yotei shutdown HH:MM');
        print('\tSchedule the system to shut down at the time HH:MM specified as an argument.');
        print('yotei help');
        print('\tShows Yotei\'s usage and features');
    }

    void detectOS() {
        // Chama código de platform/ que de fato irá detectar o OS (não faz a detecção em si)
    }

    void shutdown(int seconds) {
        // Chama código de platform/ que de fato irá desligar o OS (não faz o desligamento em si)
    }
}