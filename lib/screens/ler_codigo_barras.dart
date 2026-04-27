import 'package:flutter/material.dart';

class TelaLerCodigoBarras extends StatelessWidget {
  const TelaLerCodigoBarras({Key? key}) : super(key: key);

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
            Text('SCANNER DE PRODUTO', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(width: 4, height: 40, color: Colors.white70),
                            const SizedBox(width: 4),
                            Container(width: 2, height: 40, color: Colors.white70),
                            const SizedBox(width: 4),
                            Container(width: 6, height: 40, color: Colors.white70),
                            const SizedBox(width: 4),
                            Container(width: 2, height: 40, color: Colors.white70),
                            const SizedBox(width: 4),
                            Container(width: 4, height: 40, color: Colors.white70),
                            const SizedBox(width: 4),
                            Container(width: 2, height: 40, color: Colors.white70),
                            const SizedBox(width: 4),
                            Container(width: 6, height: 40, color: Colors.white70),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('Aponte a câmera para o código de barras', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E00C8),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner, color: Colors.white),
                  SizedBox(width: 8),
                  Text('ESCANEAR CÓDIGO DE BARRAS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1E00C8), width: 1.5),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit, color: Color(0xFF1E00C8)),
                  SizedBox(width: 8),
                  Text('DIGITAR MANUALMENTE', style: TextStyle(color: Color(0xFF1E00C8), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
