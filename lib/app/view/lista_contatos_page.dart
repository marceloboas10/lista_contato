import 'package:flutter/material.dart';
import 'package:lista_contatos/app/database/sqflite/dao/contato_dao_impl.dart';
import 'package:lista_contatos/app/domain/entities/contato.dart';
import 'package:lista_contatos/app/lista_contatos.dart';


class ListaContatosPage extends StatefulWidget {
  const ListaContatosPage({super.key});

  @override
  State<ListaContatosPage> createState() => _ListaContatosPageState();
}

class _ListaContatosPageState extends State<ListaContatosPage> {

  Future<List<Contato?>>? _buscaDados() async {
    return ContatoDaoImpl().buscar();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscaDados(),
        builder: (context, dadosBanco) {
          if (dadosBanco.hasData) {
            List<Contato?>? lista = dadosBanco.data;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Lista de Contatos'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ListaContatos.routeFormContato);
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: lista?.length,
                itemBuilder: (contex, index) {
                  var contatos = lista?[index];
                  var avatar = CircleAvatar(
                    backgroundImage: NetworkImage(
                      contatos?.urlAvatar ?? '',
                    ),
                  );

                  return ListTile(
                    title: Text(contatos?.nome ?? ''),
                    subtitle: Text(contatos?.telefone ?? ''),
                    leading: avatar,
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
