import 'package:flutter/material.dart';
import 'mercados_disponiveis.dart';

class TelaComprasFaltantesDelivery extends StatelessWidget {
  const TelaComprasFaltantesDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xFF1E00C8),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Column(
          children: const [
            Text('DESPENSA INTELIGENTE', style: TextStyle(fontSize: 12, color: Colors.white70)),
            Text('DELIVERY \uD83D\uDEF5', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF1E00C8),
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.notifications_active, color: Colors.redAccent),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Produtos Acabando!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text('Compre agora os itens que estão em falta na sua despensa.', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('ITENS FALTANTES PARA COMPRAR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54)),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                _WidgetItemDelivery(nome: 'Arroz 5kg', preco: 'R\$ 24,90', status: 'URGENTE', corStatus: Colors.red),
                _WidgetItemDelivery(nome: 'Feijão Carioca 1kg', preco: 'R\$ 8,50', status: 'URGENTE', corStatus: Colors.red),
                _WidgetItemDelivery(nome: 'Azeite 500ml', preco: 'R\$ 19,90', status: 'URGENTE', corStatus: Colors.red),
                _WidgetItemDelivery(nome: 'Ovos (dúzia)', preco: 'R\$ 12,00', status: 'BAIXO', corStatus: Colors.orange),
                _WidgetItemDelivery(nome: 'Leite Integral 4un', preco: 'R\$ 18,00', status: 'BAIXO', corStatus: Colors.orange),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaMercadosDisponiveis()));
        },
        icon: const Icon(Icons.store, color: Colors.black87),
        label: const Text('Ver Mercados', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _WidgetItemDelivery extends StatelessWidget {
  final String nome;
  final String preco;
  final String status;
  final Color corStatus;

  const _WidgetItemDelivery({
    Key? key,
    required this.nome,
    required this.preco,
    required this.status,
    required this.corStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 16,
            child: const Icon(Icons.shopping_cart, size: 16, color: Colors.grey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(preco, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: corStatus.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(status, style: TextStyle(color: corStatus, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E00C8),
              minimumSize: const Size(60, 30),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item adicionado ao seu carrinho virtual!'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: const Text('COMPRAR', style: TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
    );
  }
}