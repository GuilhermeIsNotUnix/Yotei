import 'package:yotei/cli/cli_interface.dart';

void main(List<String> arguments) {
  print('$arguments');

  final cli = CliInterface(arguments);
  cli.run();
}
