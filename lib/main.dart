import 'package:flutter/material.dart';
import 'screens/inicio_painel.dart';
import 'screens/listagem_alimentos.dart';
import 'screens/colocar_novo_produto.dart';
import 'screens/configs_notificacoes.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despensa Inteligente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E00C8)),
        useMaterial3: true,
      ),
      home: const NavegacaoPrincipal(),
    );
  }
}

class NavegacaoPrincipal extends StatefulWidget {
  const NavegacaoPrincipal({Key? key}) : super(key: key);

  @override
  State<NavegacaoPrincipal> createState() => _NavegacaoPrincipalEstado();
}

class _NavegacaoPrincipalEstado extends State<NavegacaoPrincipal> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    const TelaInicioPainel(),
    const TelaListagemAlimentos(),
    const TelaColocarNovoProduto(),
    const TelaConfigsNotificacoes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E00C8),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Lista'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Adicionar'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificações'),
        ],
      ),
    );
  }
}
