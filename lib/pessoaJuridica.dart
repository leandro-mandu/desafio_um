import 'pessoa.dart';

class PessoaJuridica extends Pessoa {
  String _razaoSocial;
  PessoaJuridica(super.doc, super.nome, super.endereco, this._razaoSocial);
  bool validarCnpj(String cnpj) {
    if (int.tryParse(super.doc) == null || super.doc.length != 14) {
      print("CNPJ inválido!");
      return false;
    }
    return true;
  }

  String formataCnpj([String doc = ""]) {
    if (doc == "") {
      doc = super.doc;
    }
    String cnpj = doc.substring(0, 2) +
        "." +
        doc.substring(2, 5) +
        "." +
        doc.substring(5, 8) +
        "/" +
        doc.substring(8, 12) +
        "-" +
        doc.substring(12);
    //11.941.838/0001-04
    return cnpj;
  }

  String get razaoSocial => _razaoSocial;
}
