

class Usuario{
  String _numero;
  String _nome;
  String _img;
  int _idUsuario;
  List<int> _idConvs;

  List<int> get idConvs => _idConvs;
  int get idUsuario => _idUsuario;
  String get numero => _numero;
  String get nome => _nome;
  String get img => _img;

  Usuario(this._img, this._nome, this._numero, this._idUsuario, this._idConvs);
}