import 'package:flutter/material.dart';
import '../dao/mercado_dao.dart';
import '../models/mercado.dart';

class TelaMercadosDisponiveis extends StatefulWidget {
  const TelaMercadosDisponiveis({Key? key}) : super(key: key);

  @override
  State<TelaMercadosDisponiveis> createState() => _TelaMercadosDisponiveisState();
}

class _TelaMercadosDisponiveisState extends State<TelaMercadosDisponiveis> {
  final MercadoDao _dao = MercadoDao();
  List<Mercado> _mercados = [];

  @override
  void initState() {
    super.initState();
    _carregarMercados();
  }

  void _carregarMercados() async {
    List<Mercado> lista = await _dao.listarTodos();
    setState(() {
      _mercados = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E00C8),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Column(
          children: const [
            Text('DESPENSA INTELIGENTE', style: TextStyle(fontSize: 12, color: Colors.white70)),
            Text('LISTA DE COMPRAS \uD83D\uDED2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mercados (Delivery)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E00C8))),
            const SizedBox(height: 16),
            Expanded(
              child: _mercados.isEmpty
                  ? const Center(child: Text("Nenhum mercado cadastrado."))
                  : ListView.builder(
                      itemCount: _mercados.length,
                      itemBuilder: (context, index) {
                        final mercado = _mercados[index];
                        return _CartaoMercado(
                          nome: mercado.nome,
                          endereco: mercado.endereco,
                          icone: Icons.store,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartaoMercado extends StatelessWidget {
  final String nome;
  final String endereco;
  final IconData icone;

  const _CartaoMercado({Key? key, required this.nome, required this.endereco, required this.icone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF1E00C8).withOpacity(0.1),
          child: Icon(icone, color: const Color(0xFF1E00C8)),
        ),
        title: Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(endereco, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}