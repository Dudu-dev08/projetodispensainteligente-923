import 'package:flutter/material.dart';
import 'compras_faltantes_delivery.dart';

class TelaListagemAlimentos extends StatelessWidget {
  const TelaListagemAlimentos({Key? key}) : super(key: key);

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
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _construirItemLista('LEITE INTEGRAL', 'NA VALIDADE\nVENCE EM 15/06/2026', const Color(0xFF00C853)),
                _construirItemLista('ARROZ', 'NA VALIDADE\nVENCE EM 30/12/2026', const Color(0xFF00C853)),
                _construirItemLista('FLOCOS DE MILHO', 'PERTO DA VALIDADE\nVENCE EM 7 DIAS', Colors.grey.shade400, corTexto: Colors.white),
                _construirItemLista('CEREAL', 'VENCIDO\nVENCE EM 01/01/2026', const Color(0xFFFF3D00)),
              ],
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
