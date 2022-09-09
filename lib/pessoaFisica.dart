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

  String formataCpf([String doc = ""]) {
    if (doc == "") {
      doc = super.doc;
    }

    String cpf = doc.substring(0, 3) +
        "." +
        doc.substring(3, 6) +
        "." +
        doc.substring(6, 9) +
        "-" +
        doc.substring(9);
    return cpf;
  }
}
