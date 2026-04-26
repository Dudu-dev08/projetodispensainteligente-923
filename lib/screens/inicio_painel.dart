import 'package:flutter/material.dart';
import 'dicas_da_inteligencia.dart';

class TelaInicioPainel extends StatelessWidget {
  const TelaInicioPainel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xFF1E00C8),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('DISPENSA INTELIGENTE', style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD54F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'ALERTA VOCÊ TEM 3\nALIMENTOS PERTOS\nDE VENCER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'IMPACTO ESSE MÊS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _construirGraficoBarras(),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E00C8),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaDicasDaInteligencia()),
                );
              },
              icon: const Icon(Icons.auto_awesome, color: Colors.white),
              label: const Text('Sugestões da IA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _construirGraficoBarras() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _construirItemLegenda(Colors.green, 'Consumidos'),
              const SizedBox(width: 16),
              _construirItemLegenda(Colors.redAccent, 'Desperdiçados'),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black26),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _construirGrupoBarras('Sem 1', 60, 40),
                _construirGrupoBarras('Sem 2', 80, 20),
                _construirGrupoBarras('Sem 3', 50, 30),
                _construirGrupoBarras('Sem 4', 70, 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirItemLegenda(Color cor, String rotulo) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: cor),
        const SizedBox(width: 4),
        Text(rotulo, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _construirGrupoBarras(String rotulo, int valor1, int valor2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _construirBarra(Colors.green, valor1.toDouble() * 1.5, valor1),
            const SizedBox(width: 4),
            _construirBarra(Colors.redAccent, valor2.toDouble() * 1.5, valor2),
          ],
        ),
        const SizedBox(height: 8),
        Text(rotulo, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }

  Widget _construirBarra(Color cor, double altura, int valor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(valor.toString(), style: const TextStyle(fontSize: 10, color: Colors.black45)),
        const SizedBox(height: 4),
        Container(
          width: 30,
          height: altura,
          decoration: BoxDecoration(
            color: cor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
      ],
    );
  }
}
