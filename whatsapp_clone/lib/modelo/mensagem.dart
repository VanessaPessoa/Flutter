

class Mensagem{
  DateTime _data;
  String _msg;
  int _idEmissor;
  
  String get msg => _msg;
  DateTime get data => _data;
  int get emissor => _idEmissor;

  Mensagem(this._data, this._msg, this._idEmissor);

  Mensagem.map(dynamic obj){

    _data = obj['data'];
    _msg = obj['msg'];
    _idEmissor = obj['idUser'];

  }
}