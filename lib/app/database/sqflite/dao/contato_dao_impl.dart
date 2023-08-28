import 'package:lista_contatos/app/database/sqflite/conexao.dart';
import 'package:lista_contatos/app/domain/entities/contato.dart';
import 'package:lista_contatos/app/domain/interfaces/contato_dao.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDaoImpl implements ContatoDao {
  Database? _database;

  @override
  Future<List<Contato>> buscar() async {
    _database = await Conexao.get();
    List<Map<String, dynamic>>? resultado = await _database?.query('contatos');
    List<Contato> lista = List.generate(resultado!.length, (index) {
      var linha = resultado[index];
      return Contato(
          id: linha['id'],
          nome: linha['nome'],
          telefone: linha['telefone'],
          email: linha['email'],
          urlAvatar: linha['url_avatar']);
    });

    return lista;
  }

  @override
  deletar(int id) async {
    _database = await Conexao.get();
    var sql = 'DELETE FROM contatos WHERE id =?';
    _database?.rawDelete(sql, [id]);
  }

  @override
  salvar(Contato contato) async {
    _database = await Conexao.get();
    String sql;
    if (contato.id == null) {
      sql =
          'INSERT INTO contatos(nome, telefone, email, url_avatar) VALUES (?,?,?,?)';
      _database?.rawQuery(sql,
          [contato.nome, contato.telefone, contato.email, contato.urlAvatar]);
    } else {
      sql =
          'UPDATE contatos SET nome=?, telefone=?,email=?,url_avatar=? WHERE id = ?';
      _database?.rawUpdate(sql,
          [contato.nome, contato.telefone, contato.email, contato.urlAvatar]);
    }
  }
}
