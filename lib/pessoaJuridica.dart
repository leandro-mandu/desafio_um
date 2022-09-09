import 'pessoa.dart';

class PessoaJuridica extends Pessoa {
  String _razaoSocial;
  PessoaJuridica(super.doc, super.nome, super.endereco, this._razaoSocial);
  bool validarCpf(String cpf) {
    if (int.tryParse(super.doc) == null || super.doc.length != 14) {
      print("CNPJ inválido!");
      return false;
    }
    return true;
  }
}
