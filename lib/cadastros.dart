import 'dart:convert';
import 'dart:io';

import 'package:desafio_um/menu.dart';
import 'package:uuid/uuid.dart';

import 'empresa.dart';
import 'pessoaFisica.dart';
import 'pessoaJuridica.dart';

final listaEmpresas = <Empresa>[];
final mapSocios = <String, dynamic>{};
cadastrarEmpresa() {
  String doc;
  String razaoSocial;
  String nomeFantasia;
  String telefone;
  Map endereco;
  String docSocio;

  limparTela();
  print('''     ____CADASTRO DE EMPRESA____
  ''');

  doc = input("CNPJ da empresa", int);
  razaoSocial = input("Razao Social");
  nomeFantasia = input("Nome Fantasia");
  telefone = input("Telefone", int);
  endereco = cadastrarEndereco();
  docSocio = cadastrarSocio();
  final empresa = Empresa(doc, nomeFantasia, endereco, razaoSocial, Uuid().v1(),
      telefone, DateTime.now(), docSocio);
  listaEmpresas.add(empresa);

/*

  String doc = input("CPF ou CNPJ do sócio vinculado:", int);
  if (PessoaFisica().validarCpf(doc)) {
    socio = PessoaFisica(id, doc, nome);
  } else if (PessoaJuridica().validarCnpj(doc)) {
    socio = PessoaJuridica(id, doc, nome);
  }
*/
  //sócio: 1-pf, 2-pJ
  //se 1 cadPj()
  //senao se 2 cadPf()
  //obj socio

//cad empresa(socio)
  //ID, Razão Social, Nome Fantasia, CNPJ, Endereço (Logradouro, Número, Complemento, Bairro, Estado e CEP), Telefone, Horário do Cadastro e Sócio.
}

String cadastrarSocio() {
  String doc = "";
  print('''     ____CADASTRO DE SÓCIO____
  ''');

  while (doc == "") {
    doc = input("CPF ou CNPJ do sócio", int);
    if (mapSocios.containsKey(doc)) {
      print("O sócio já está cadastrado!");
      return doc;
    }
    switch (doc.length) {
      case 11:
        cadastrarPf(doc);
        break;
      case 14:
        cadastrarPj(doc);
        break;
      default:
        print("CPF/CNPJ INVÁLIDO!");
        doc = "";
    }
  }

/*
    if (PessoaFisica().validarCpf(doc)) {
    socio = PessoaFisica(id, doc, nome);
  } else if (PessoaJuridica().validarCnpj(doc)) {
    socio = PessoaJuridica(id, doc, nome);
  }
*/

  return doc;
}

cadastrarPf(String cpf) {
  String nome = input("Nome do Sócio");
  Map endereco = cadastrarEndereco();
  final socio = PessoaFisica(cpf, nome, endereco);
  mapSocios.addAll({cpf: socio});
}

cadastrarPj(String cnpj) {
  String razaoSocial = input("Razao Social");
  String nomeFantasia = input("Nome Fantasia");
  Map endereco = cadastrarEndereco();
  final socio = PessoaJuridica(cnpj, nomeFantasia, endereco, razaoSocial);
  mapSocios.addAll({cnpj: socio});
}

Map<String, String> cadastrarEndereco() {
  String erro = "";
  final endereco = <String, String>{};
  do {
    print('''     ____CADASTRO DE ENDEREÇO____
  ''');

    endereco['logradouro'] = input("Logradouro");
    endereco['numero'] = input("Número", int);
    endereco['complemento'] = input("complemento");
    endereco['bairro'] = input("bairro");
    endereco['estado'] = input("estado");
    endereco['CEP'] = input("cep", int);
  } while (erro != "");
  return endereco;
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
