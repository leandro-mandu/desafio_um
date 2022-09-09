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
}
