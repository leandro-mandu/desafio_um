import 'dart:convert';
import 'dart:io';
import 'cadastros.dart';

//import 'package:uuid/uuid.dart';

void menuPrincipal() {
  String opcao = "";
  String feedback = "";
  do {
    limparTela();
    print(feedback);
    feedback = "";
    print('''(${listaEmpresas.length} empresa(s) cadastrada(s))''');
    print('''     ____MENU____
  1) Cadastrar uma nova empresa
  2) Buscar Empresa cadastrada por CNPJ
  3) Buscar Empresa por CPF/CNPJ do Sócio
  4) Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)
  5) Excluir uma empresa (por ID)
  
  0) Sair''');
    opcao = stdin.readLineSync(encoding: utf8)!;
    switch (opcao) {
      case '1':
        cadastrarEmpresa();
        break;
      case '2':
        break;
      case '3':
        break;
      case '4':
        break;
      case '5':
        break;
      default:
        feedback = "OPCAO INVALIDA, TENTE NOVAMENTE!";
    }
  } while (opcao != '0');
}

void limparTela() {
  print("\x1B[2J\x1B[0;0H");
}
