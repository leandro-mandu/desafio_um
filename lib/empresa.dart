import 'pessoaJuridica.dart';

class Empresa extends PessoaJuridica {
  final _id;
  final _dataCadastro;
  String _telefone;
  String _docSocio;
  Empresa(super.doc, super.nome, super.endereco, super.razaoSocial, this._id,
      this._telefone, this._dataCadastro, this._docSocio);
}
