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
        pesquisarEmpresa(true);
        break;
      case '4':
        listarEmpresas();
        break;
      case '5':
        excluirEmpresa();
        break;
      default:
        feedback = "OPCAO INVALIDA, TENTE NOVAMENTE!";
    }
  } while (opcao != '0');
}

void listarEmpresas() {
  listaEmpresas.sort((a, b) =>
      a.razaoSocial.toUpperCase().compareTo(b.razaoSocial.toUpperCase()));
  limparTela();
  print('''     ____LISTA DE EMPRESAS____
  ''');

  listaEmpresas.forEach((e) {
    print("ID: ${e.id} | Razão social: ${e.razaoSocial}");
  });
  print("Pressione enter para voltar ao menu inicial");
  stdin.readLineSync();
}

void mostrarEmpresa(final empresa, final socio) {
  print('''

ID: ${empresa.id}
CNPJ: ${empresa.formataCnpj()} Data Cadastro: ${empresa.dataCadastro}
Razão Social: ${empresa.razaoSocial}
Nome Fantasia: ${empresa.nome}
Telefone: ${empresa.formataTelefone()}
Endereço: ${empresa.endereco['logradouro']}, ${empresa.endereco['numero']}, ${empresa.endereco['bairro']}, ${empresa.endereco['complemento']}/${empresa.endereco['estado']}, ${empresa.endereco['CEP']}
Sócio:''');
  if (empresa.docSocio.length == 14) {
    print("CNPJ: " + socio.formataCnpj());
  } else {
    print("CPF: " + socio.formataCpf());
  }

  print('''
Nome Completo: ${socio.nome}
Endereço: ${socio.endereco['logradouro']}, ${socio.endereco['numero']}, ${socio.endereco['bairro']}, ${socio.endereco['complemento']}/${socio.endereco['estado']}, ${socio.endereco['CEP']}
''');
}

void pesquisarEmpresa([bool socio = false]) {
  limparTela();
  print('''     ____PESQUISA DE EMPRESA____
  ''');
  String opcao = '';
  while (opcao != '0') {
    if (socio) {
      opcao = input('CNPJ ou CPF do sócio, ou "0" para sair', int);
    } else {
      opcao = input('CNPJ ou "0" para sair', int);
    }
    if (opcao != '0') {
      int i;
      for (i = 0; i < listaEmpresas.length; i++) {
        if (!socio && listaEmpresas[i].doc == opcao) {
          mostrarEmpresa(
              listaEmpresas[i], mapSocios[listaEmpresas[i].docSocio]);
          break;
        } else if (socio && listaEmpresas[i].docSocio == opcao) {
          mostrarEmpresa(
              listaEmpresas[i], mapSocios[listaEmpresas[i].docSocio]);
          break;
        }
      }
      if (i == listaEmpresas.length) {
        print("EPRESA NÃO ENCONTRADA!");
        //      opcao = input('CNPJ ou "0" para sair', int);
      }
    }
  }
}

void excluirEmpresa() {
  limparTela();
  print('''     ____EXCLUIR EMPRESA____
  ''');
  String opcao = '';
  while (opcao != '0') {
    opcao = input('ID da empresa a ser excluida ou "0" para cancelar');
    if (opcao != '0') {
      int i;
      for (i = 0; i < listaEmpresas.length; i++) {
        if (listaEmpresas[i].id == opcao) {
          print('''
Deseja realmente excluir a empresa ${listaEmpresas[i].nome}?  
1) Sim
0) Não
''');
          opcao = stdin.readLineSync(encoding: utf8)!;
          if (opcao == '1') {
            listaEmpresas.removeAt(i);
            print(
                "EMPRESA EXCLUÍDA! Pressione enter para voltar ao menu inicial");
            stdin.readLineSync();
            return;
          }
          break;
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
