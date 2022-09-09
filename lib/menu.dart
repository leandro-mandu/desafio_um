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
        pesquisarEmpresa();
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

void pesquisarEmpresa() {
  limparTela();
  print('''     ____PESQUISA DE EMPRESA____
  ''');
  String opcao = '';
  while (opcao != '0') {
    opcao = input('CNPJ ou "0" para sair', int);
    if (opcao != '0') {
      int i;
      for (i = 0; i < listaEmpresas.length; i++) {
        if (listaEmpresas[i].doc == opcao) {
          print('''

ID: ${listaEmpresas[i].id}
CNPJ: ${listaEmpresas[i].formataCnpj()} Data Cadastro: ${listaEmpresas[i].dataCadastro}
Razão Social: ${listaEmpresas[i].razaoSocial}
Nome Fantasia: ${listaEmpresas[i].nome}
Telefone: ${listaEmpresas[i].formataTelefone()}
Endereço: ${listaEmpresas[i].endereco['logradouro']}, ${listaEmpresas[i].endereco['numero']}, ${listaEmpresas[i].endereco['bairro']}, ${listaEmpresas[i].endereco['complemento']}/${listaEmpresas[i].endereco['estado']}, ${listaEmpresas[i].endereco['CEP']}
Sócio:
CPF: 763.679.800-08
Nome Completo: Mirella Kamilly Letícia Barbosa
Endereço: Rua Ulisses Bueno, 175, Vila Rosa, Aparecida de Goiânia/GO, 74.935-870
''');
          break;
//          opcao = input('CNPJ ou "0" para sair', int);
        }
      }
      if (i == listaEmpresas.length) {
        print("EPRESA NÃO ENCONTRADA!");
        //      opcao = input('CNPJ ou "0" para sair', int);
      }
    }
  }
}

void limparTela() {
  print("\x1B[2J\x1B[0;0H");
}
