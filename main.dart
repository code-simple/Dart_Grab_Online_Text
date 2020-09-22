import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dart_console/dart_console.dart';

final console = Console();

void main() async {
  var _data = await getText();
  var pass;

  while (pass != '${_data['password']}') {
    console.clearScreen();
    stdout.write('Enter Password: ');
    pass = stdin.readLineSync();
  }
  return console.writeLine(_data['message'], TextAlignment.center);
}

Future<Map> getText() async {
  console.clearScreen();
  stdout.write('Please Wait . . .');
  var txtUrl =
      'https://drive.google.com/uc?export=download&id=1rTyypEJDkKePMVtsE1im9gdh5r6jKUbG';
  var response = await http.get(txtUrl);
  return json.decode(response.body);
}
