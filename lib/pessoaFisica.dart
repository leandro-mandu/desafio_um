import 'pessoa.dart';

class PessoaFisica extends Pessoa {
  PessoaFisica(super.doc, super.nome, super.endereco) {
    validarCpf(super.doc);
  }
  bool validarCpf(String cpf) {
    if (int.tryParse(super.doc) == null || super.doc.length != 11) {
      print("CPF inválido!");
      return false;
    }
    return true;
  }
}
