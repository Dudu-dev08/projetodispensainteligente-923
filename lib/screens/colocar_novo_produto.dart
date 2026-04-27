import 'package:flutter/material.dart';
import 'ler_codigo_barras.dart';

class TelaColocarNovoProduto extends StatelessWidget {
  const TelaColocarNovoProduto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xFF1E00C8),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('ADICIONAR', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaLerCodigoBarras()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              _construirLinhaEntrada('NOME DO PRODUTO:'),
              const SizedBox(height: 32),
              _construirLinhaEntrada('QUANTIDADE:', pequeno: true),
              const SizedBox(height: 32),
              _construirLinhaEntrada('DATA DE VALIDADE:', data: true),
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E00C8),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Produto guardado na sua despensa com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('SALVAR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirLinhaEntrada(String rotulo, {bool pequeno = false, bool data = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            rotulo,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
        Expanded(
          flex: pequeno ? 1 : 3,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2)),
              ],
            ),
            child: data
                ? const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(' / '),
                Text(' / '),
              ],
            )
                : const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              ),
            ),
          ),
        ),
        if (pequeno) const Spacer(flex: 2),
      ],
    );
  }
}
