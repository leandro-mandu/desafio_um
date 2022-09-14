import 'package:desafio_um/pessoaFisica.dart';
import 'package:desafio_um/pessoaJuridica.dart';
import 'package:desafio_um/pessoa.dart';

import 'package:uuid/uuid.dart';

import 'empresa.dart';

void carregarEmpresasTeste(List empresas, Map<String, dynamic> socios) {
  Map endereco = <String, String>{
    'logradouro': 'Rua do Sócio Um',
    'numero': '101',
    'complemento': 'antes do 102',
    'bairro': 'Bairro do Sócio Um',
    'estado': 'RJ',
    'CEP': '12345001'
  };

  Pessoa socio = PessoaFisica('12345678001', 'Sócio Um', endereco);
  endereco = <String, String>{
    'logradouro': 'Rua Um',
    'numero': '101',
    'complemento': 'antes do 102',
    'bairro': 'Bairro Um',
    'estado': 'RJ',
    'CEP': '12345001'
  };
  Empresa empresa = Empresa('12345678000101', 'Empresa Um', endereco, 'Um SA',
      Uuid().v1(), '1110010001', DateTime.now(), '12345678001');

  socios.addAll({socio.doc: socio});
  empresas.add(empresa);

  endereco = <String, String>{
    'logradouro': 'Rua  do Sócio Dois',
    'numero': '102',
    'complemento': 'exatamente no 102',
    'bairro': 'Bairro  do Sócio Dois',
    'estado': 'DF',
    'CEP': '12345002'
  };

  socio = PessoaFisica('12345678002', 'Sócio Dois', endereco);
  endereco = <String, String>{
    'logradouro': 'Rua Dois',
    'numero': '102',
    'complemento': 'antes do 103',
    'bairro': 'Bairro Dois',
    'estado': 'RJ',
    'CEP': '12345002'
  };

  empresa = Empresa('12345678000102', 'Empresa Dois', endereco, 'Dois Ltda',
      Uuid().v1(), '1210010002', DateTime.now(), '12345678002');

  socios.addAll({socio.doc: socio});
  empresas.add(empresa);

  endereco = <String, String>{
    'logradouro': 'Rua  do Sócio Três',
    'numero': '103',
    'complemento': 'após o 102',
    'bairro': 'Bairro  do Sócio Três',
    'estado': 'SP',
    'CEP': '12345003'
  };

  socio = PessoaJuridica(
      '12345678000113', 'Socio Três', endereco, 'Três Invest SA');
  endereco = <String, String>{
    'logradouro': 'Rua Tres',
    'numero': '103',
    'complemento': 'depois do 102',
    'bairro': 'Bairro Três',
    'estado': 'RJ',
    'CEP': '12345002'
  };
  empresa = Empresa('12345678000103', 'Empresa Três', endereco, 'Três SA',
      Uuid().v1(), '13910010003', DateTime.now(), '12345678000113');

  socios.addAll({socio.doc: socio});
  empresas.add(empresa);

  endereco = <String, String>{
    'logradouro': 'Rua Ulisses Bueno',
    'numero': '175',
    'complemento': 'Aparecida de Goiânia',
    'bairro': 'Vila Rosa',
    'estado': 'GO',
    'CEP': '74935870'
  };

  socio =
      PessoaFisica('76367980008', 'Mirella Kamilly Letícia Barbosa', endereco);
  endereco = <String, String>{
    'logradouro': 'Rua Tres',
    'numero': '338',
    'complemento': 'Piracicaba',
    'bairro': 'Vila Industrial',
    'estado': 'SP',
    'CEP': '13412233'
  };
  empresa = Empresa(
      '11941838000104',
      'Pães e Doces',
      endereco,
      'Elisa e Flávia Pães e Doces ME',
      'ca3e6c78-dae6-4629-b819-e5576c00f68b',
      '19988380630',
      DateTime.now(),
      '76367980008');

  socios.addAll({socio.doc: socio});
  empresas.add(empresa);

  endereco = <String, String>{
    'logradouro': 'Rua Ângelo Alberto Nesti',
    'numero': '639',
    'complemento': 'Osasco',
    'bairro': 'Bussocaba',
    'estado': 'SP',
    'CEP': '06053060'
  };

  socio = PessoaJuridica('87009263000140', 'Loc. Auto', endereco,
      'Lavínia e Tereza Locações de Automóveis Ltda');

  endereco = <String, String>{
    'logradouro': 'Rua Domingos Vendemiati',
    'numero': '154',
    'complemento': 'Jundiaí',
    'bairro': 'Parque Recanto do Parrilho',
    'estado': 'SP',
    'CEP': '13219051'
  };
  empresa = Empresa(
      '92456516000163',
      'Telas',
      endereco,
      'Arthur e Andreia Telas Ltda',
      'fb7afcf0-2669-4e2b-8bd7-72d7456762b0',
      '11995726906',
      DateTime.now(),
      '87009263000140');

  socios.addAll({socio.doc: socio});
  empresas.add(empresa);
}
