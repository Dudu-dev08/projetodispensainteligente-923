import 'package:flutter/material.dart';

class TelaConfigsNotificacoes extends StatefulWidget {
  const TelaConfigsNotificacoes({Key? key}) : super(key: key);

  @override
  State<TelaConfigsNotificacoes> createState() => _TelaConfigsNotificacoesEstado();
}

class _TelaConfigsNotificacoesEstado extends State<TelaConfigsNotificacoes> {
  int _diasSelecionados = 3;
  bool _notificacoesEstoque = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xFF1E00C8),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('NOTIFICAÇÕES', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'EM QUANTOS DIAS DESEJA SER AVISADO:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _construirBotaoDia(1, '1 DIA'),
                _construirBotaoDia(3, '3 DIAS'),
                _construirBotaoDia(5, '5 DIAS'),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              'Aviso: O app vai notificar antes do vencimento do item de acordo com essa escolha.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            const SizedBox(height: 40),
            const Divider(thickness: 1.5),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'OUTRAS CONFIGURAÇÕES',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E00C8)),
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Notificações de Estoque', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Avisar quando os itens estiverem acabando', style: TextStyle(fontSize: 12)),
              value: _notificacoesEstoque,
              activeColor: const Color(0xFF1E00C8),
              onChanged: (val) {
                setState(() {
                  _notificacoesEstoque = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirBotaoDia(int dias, String rotulo) {
    bool estaSelecionado = _diasSelecionados == dias;

    return GestureDetector(
      onTap: () {
        setState(() {
          _diasSelecionados = dias;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notificações ajustadas para $dias dias antes do vencimento.'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: estaSelecionado ? const Color(0xFF1E00C8) : Colors.white,
          border: Border.all(
              color: estaSelecionado ? const Color(0xFF1E00C8) : Colors.black26,
              width: 2
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            rotulo,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: estaSelecionado ? Colors.white : Colors.black87,
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
