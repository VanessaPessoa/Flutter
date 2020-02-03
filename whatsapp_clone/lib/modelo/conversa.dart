
class Conversa{
  String _img;
  String _nomeConversa;
  int _idConv; 
  List<int> _idUsers;

  String get nomeConversa => _nomeConversa;
  List<int> get users => _idUsers;
  String get img => _img;
  int get idConv => _idConv;

  Conversa( this._idConv,this._nomeConversa, this._img, this._idUsers);

  Conversa.map(dynamic obj){
    _img = obj['imagem'];
    _nomeConversa= obj['nome'];
    _idConv = obj['idConv'];
    _idUsers = obj['idUsers'];

  }
}

