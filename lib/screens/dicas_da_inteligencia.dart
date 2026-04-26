import 'package:flutter/material.dart';

class TelaDicasDaInteligencia extends StatelessWidget {
  const TelaDicasDaInteligencia({Key? key}) : super(key: key);

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
            Text('SUGESTÕES DA IA \uD83E\uDD16', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1E00C8), width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.shopping_basket, color: Colors.orange, size: 20),
                        SizedBox(width: 8),
                        Text('INGREDIENTES DISPONÍVEIS', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E00C8))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        _ChipIngrediente(rotulo: 'Leite Integral'),
                        _ChipIngrediente(rotulo: 'Arroz'),
                        _ChipIngrediente(rotulo: 'Ovos'),
                        _ChipIngrediente(rotulo: 'Tomate'),
                        _ChipIngrediente(rotulo: 'Frango'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E00C8).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1E00C8).withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.restaurant, color: Color(0xFF1E00C8)),
                        SizedBox(width: 8),
                        Text('Receita Sugerida!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E00C8))),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Arroz de Forno Cremoso com Frango',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Aproveitando seus ingredientes, você pode desfiar o frango, misturar com o arroz já cozido, picar os tomates para dar frescor e criar um creme com o leite e os ovos para gratinar!',
                      style: TextStyle(height: 1.5, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipIngrediente extends StatelessWidget {
  final String rotulo;
  const _ChipIngrediente({Key? key, required this.rotulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E00C8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(rotulo, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}
