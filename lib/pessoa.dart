abstract class Pessoa {
  String _doc;
  String _nome;
  Map endereco = <String, String>{};
  /*{
    'logradouro': '',
    'numero': '',
    'complemento': '',
    'bairro': '',
    'estado': '',
    'CEP': ''
  };
  */
  Pessoa(this._doc, this._nome, this.endereco);
  String get nome => _nome;
  void set nome(String nome) {
    _nome = nome;
  }

  String get doc => _doc;
}
