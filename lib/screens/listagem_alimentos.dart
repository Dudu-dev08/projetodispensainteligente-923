import 'package:flutter/material.dart';
import 'compras_faltantes_delivery.dart';
import '../dao/alimento_dao.dart';
import '../models/alimento.dart';

class TelaListagemAlimentos extends StatefulWidget {
  const TelaListagemAlimentos({Key? key}) : super(key: key);

  @override
  State<TelaListagemAlimentos> createState() => _TelaListagemAlimentosState();
}

class _TelaListagemAlimentosState extends State<TelaListagemAlimentos> {
  final AlimentoDao _dao = AlimentoDao();
  late Future<List<Alimento>> futureLista;

  @override
  void initState() {
    super.initState();
    futureLista = _dao.listarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xFF1E00C8),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('LISTA DE ALIMENTOS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade400),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: Icon(Icons.search, color: Colors.black87),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Alimento>>(
              future: futureLista,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final listaAlimentos = snapshot.requireData;
                if (listaAlimentos.isEmpty) {
                  return const Center(child: Text("Nenhum alimento cadastrado."));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: listaAlimentos.length,
                  itemBuilder: (context, index) {
                    final alimento = listaAlimentos[index];

                    Color corFundo = const Color(0xFF00C853);
                    Color corTexto = Colors.white;
                    if (alimento.status.toLowerCase() == 'vencido') {
                      corFundo = const Color(0xFFFF3D00);
                    } else if (alimento.status.toLowerCase().contains('perto')) {
                      corFundo = Colors.grey.shade400;
                    }

                    return _construirItemLista(
                      alimento.nome,
                      '${alimento.status}\nVENCE EM ${alimento.validade}',
                      corFundo,
                      corTexto: corTexto,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E00C8),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaComprasFaltantesDelivery()),
          );
        },
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        label: const Text('Compras', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _construirItemLista(String titulo, String subtitulo, Color corFundo, {Color corTexto = Colors.white}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: corFundo,
        border: Border.all(color: Colors.black87, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo, style: TextStyle(color: corTexto, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      subtitulo,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: corTexto, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
