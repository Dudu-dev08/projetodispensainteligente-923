import 'package:flutter/material.dart';
import '../dao/notificacao_dao.dart';
import '../models/notificacao.dart';


class TelaConfigsNotificacoes extends StatefulWidget {
  const TelaConfigsNotificacoes({Key? key}) : super(key: key);

  @override
  State<TelaConfigsNotificacoes> createState() => _TelaConfigsNotificacoesEstado();
}

class _TelaConfigsNotificacoesEstado extends State<TelaConfigsNotificacoes> {

  int _diasSelecionados = 3;
  bool _notificacoesEstoque = true;

  final NotificacaoDao _dao = NotificacaoDao();
  List<Notificacao> _notificacoes = [];

  @override
  void initState() {
    super.initState();
    _carregarNotificacoes();
  }

  void _carregarNotificacoes() async {
    List<Notificacao> lista = await _dao.listarTodas();
    setState(() {
      _notificacoes = lista;
    });
  }

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
            const Text(
              'EM QUANTOS DIAS DESEJA SER AVISADO:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _construirBotaoDia(1, '1 DIA'),
                _construirBotaoDia(3, '3 DIAS'),
                _construirBotaoDia(5, '5 DIAS'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Aviso: O app vai notificar antes do vencimento do item de acordo com essa escolha.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'OUTRAS CONFIGURAÇÕES',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E00C8)),
              ),
            ),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
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
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ALERTAS SALVOS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E00C8)),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _notificacoes.isEmpty
                  ? const Center(child: Text("Nenhum alerta salvo."))
                  : ListView.builder(
                      itemCount: _notificacoes.length,
                      itemBuilder: (context, index) {
                        final notif = _notificacoes[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const Icon(Icons.notifications, color: Color(0xFF1E00C8)),
                            title: Text(notif.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${notif.data}\n${notif.mensagem}'),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
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
        width: 80,
        height: 80,
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
