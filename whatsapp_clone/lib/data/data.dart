import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whatsapp_clone/modelo/conversa.dart';
import 'package:whatsapp_clone/modelo/mensagem.dart';
import 'package:whatsapp_clone/modelo/usuario.dart';
class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  // Create table
  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE Usuario(idUser INTEGER PRIMARY KEY , nome TEXT, numero TEXT,  imagem VARCHAR);");
    await db.execute(
      "CREATE TABLE Conversa(idConv INTEGER PRIMARY KEY, nome TEXT, imagem VARCHAR );");
    await db.execute(
      "CREATE TABLE Mensagem(idMsg INTEGER  PRIMARY KEY, msg TEXT , idUser INTEGER, idConv INTEGER, FOREIGN KEY(idUser) REFERENCES Usuario(idUser), FOREIGN KEY(idConv) REFERENCES Conversa(idConv), data DATETIME);");
    await db.execute(
      'CREATE TABLE ConversaUser(idConv INTEGER NOT NUL, idUser INTEGER NOT NULL, FOREIGN KEY(idConv) REFERENCES Conversa(idConv), FOREIGN KEY(idUser) REFERENCES Usuario(idUser))');
    


    // User (idU: 1 , nome: nessaVeia, numero: 8888 )
    // User (idU: 2, nome: viniLindu, numero: 9999)
    //Conversa(idConv: 0, nome: aulaNao )
    //Mensagem(idMen: 0 , idU: 1 ,idConv: 0 ,msg: eu sou bestada , data: 03/02/2020 08:00)
    //ConversaUser(idConv: 0 , idU: 1)
    //ConversaUser(idConv: 0, idU: 2)


    }

//insertion
  //OK
  Future<int> saveUser(Usuario user) async {
    var dbClient = await db;
    int usuario = await dbClient.rawInsert("INSERT INTO Usuario (nome, numero, imagem) VALUES(?,?,?)",[user.nome,user.numero,user.img]);
    return usuario;
  }

  //OK
  Future<int> saveConversa(Conversa conv) async {
    var dbClient = await db;
    int conversa = await dbClient.rawInsert("INSERT INTO Conversa (nome, imagem) VALUES(?,?)",[conv.nomeConversa,conv.img]);
    return conversa;
  }

  //OK
  Future<int> saveMsg(Mensagem msg, int idConv) async {
    var dbClient = await db;
    int mensagem = await dbClient.rawInsert("INSERT INTO Mensagem (idUser,data, msg, idConv) VALUES(?,?,?,?)",[msg.emissor,msg.data,msg.msg,idConv]);
    return mensagem;
  }

  //OK
  Future<int> saveConvUser(List<Usuario> user, Conversa conv ) async{
    var dbClient = await db;
    for(Usuario i in user){
      dbClient.rawInsert(
        'INSERT INTO ConversaUser(idUser, idConv) VALUES(?,?)', [i.idUsuario, conv.idConv]);
    }
    return 1;
  }


  //Get

  Future<Usuario> getUserNum(String numero) async{
    var dbClient = await db;
    dynamic test = await dbClient.query("Usuario",
    columns: ["idUser","nome", "imagem"],
    where: "numero =?",
    whereArgs: ["$numero"]
    );
    List<int> idConvs = await getConversaUser(test[0]["idUser"]);
    Usuario u = Usuario(test[0]['imagem'],test[0]['nome'],test[0]['numero'],test[0]['idUser'], idConvs);
    return u;
  }

  Future<Usuario> getUserId(int id) async{
    var dbClient = await db;
    dynamic test = await dbClient.query("Usuario",
    columns: ["numero","nome", "imagem"],
    where: "idUser =?",
    whereArgs: ["$id"]
    );
    List<int> idConvs = await getConversaUser(id);
    Usuario u = Usuario(test[0]["imagem"], test[0]["nome"],test[0]["numero"], test[0]["idUser"], idConvs);
    return u;    
  }

  Future<dynamic> getConversaUser(int idUser) async{
    var dbClient = await db;
    dynamic test = await dbClient.query("ConvesaUser",
    columns:["idConv"],
    where: "idUser = ?", 
    whereArgs:["$idUser"]
    );
    print(test);
    return test;
  }

  Future<List<int>> getUserConversa(int idConv) async{
    var dbClient = await db;
    dynamic test = await dbClient.query("ConvesaUser",
    columns:["idUser"],
    where: "idConv = ?", 
    whereArgs:["$idConv"]
    );
    return test;
  }

  Future<Conversa> getConversa(int idConv) async{
    var dbClient = await db;
    dynamic test = await dbClient.query("Conversa",
    columns:["nome", "imagem"],
    where: "idConv = ?",
    whereArgs:["$idConv"]
    );
    List<int> idUsers = await getUserConversa(idConv);
    test['idUsers'] = idUsers;
    Conversa c = Conversa.map(test[0]);    
    return c;
  }
 
 Future<List<Mensagem>> getMensagem(idConv) async{
   var dbClient = await db;
   dynamic test = await dbClient.query("Mensagem",
   columns: ["msg", "idUser", "idMsg","data"],
   where: "idConv = ?",
   whereArgs:["$idConv"]
   );
   List<Mensagem> m = new List<Mensagem>();
   for(dynamic i in test){
     m.add(Mensagem.map(i));
   }
   return m;

 }
}

