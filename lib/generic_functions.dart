import 'dart:convert';
import 'dart:io';

void limparTela() {
  print("\x1B[2J\x1B[0;0H");
}

String input(String campo, [Type tipo = String]) {
  String saida = "";
  while (saida.trim() == "") {
    print("Digite o(a) $campo:");
    if (tipo == int) print("(apenas números)");
    saida = stdin.readLineSync(encoding: utf8)!;
    if (tipo == int && int.tryParse(saida) == null) {
      print("POR FAVOR, DIGITE UM NÚMERO VÁLIDO");
      saida = "";
    }
  }
  return saida.trim();
}
