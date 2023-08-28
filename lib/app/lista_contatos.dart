import 'package:flutter/material.dart';
import 'package:lista_contatos/app/view/contato_formulario.dart';
import 'view/lista_contatos_page.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({super.key});
  static const routeHome = '/';
  static const routeFormContato = 'formularioContato';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista Contatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      routes: {
        routeHome: (context) => const ListaContatosPage(),
        routeFormContato: (context) => const ContatoFormulario(),
      },
    );
  }
}
