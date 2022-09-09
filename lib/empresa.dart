import 'pessoaJuridica.dart';

class Empresa extends PessoaJuridica {
  final _id;
  final _dataCadastro;
  String _telefone;
  String _docSocio;
  Empresa(super.doc, super.nome, super.endereco, super.razaoSocial, this._id,
      this._telefone, this._dataCadastro, this._docSocio);

  String get id => _id;
  DateTime get dataCadastro => _dataCadastro;

  String formataTelefone() {
    String tel;
    if (_telefone.length == 11) {
      //celular
      tel = "(" +
          _telefone.substring(0, 2) +
          ") " +
          _telefone.substring(2, 3) +
          " " +
          _telefone.substring(3, 7) +
          "-" +
          _telefone.substring(7);
    } else {
      //fixo
      tel = "(" +
          _telefone.substring(0, 2) +
          ") " +
          _telefone.substring(2, 6) +
          "-" +
          _telefone.substring(6);
    }
    return tel;
  }
}
