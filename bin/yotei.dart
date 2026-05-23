import 'package:yotei/cli/cli_interface.dart';

void main(List<String> arguments) async {
  final cli = CliInterface(arguments);
  cli.run();
}
