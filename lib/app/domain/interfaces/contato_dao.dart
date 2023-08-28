import 'package:lista_contatos/app/domain/entities/contato.dart';

abstract class ContatoDao {
  salvar(Contato contato);

  deletar(int id);

  Future<List<Contato>> buscar();
}
