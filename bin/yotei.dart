import 'package:yotei/cli/cli_interface.dart';

void main(List<String> arguments) {
  final cli = CliInterface(arguments);
  cli.run();
}
