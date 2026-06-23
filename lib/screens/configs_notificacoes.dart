import 'package:flutter/material.dart';
import '../dao/notificacao_dao.dart'; //comunicacao com banco de dados
import '../models/notificacao.dart'; //modelo de notificacao


class TelaConfigsNotificacoes extends StatefulWidget { //tela dinâmica
  const TelaConfigsNotificacoes({Key? key}) : super(key: key);

  @override
  State<TelaConfigsNotificacoes> createState() => _TelaConfigsNotificacoesEstado();
}

class _TelaConfigsNotificacoesEstado extends State<TelaConfigsNotificacoes> {

  int _diasSelecionados = 3; //botao de dias
  bool _notificacoesEstoque = true; //controle das notificacoes de estoque; start on true

  final NotificacaoDao _dao = NotificacaoDao(); //ponte com banco de dados; final = permanente
  List<Notificacao> _notificacoes = [];

  @override
  void initState() {
    super.initState();
    _carregarNotificacoes(); //chama funcao
  }

  void _carregarNotificacoes() async { //cria funcao; modo assincrono
    List<Notificacao> lista = await _dao.listarTodas(); //fica na picota
    setState(() { //mudanca de tela
      _notificacoes = lista; //guarda notificacoes
    });
  }

  @override
  Widget build(BuildContext context) { //desenha widgets
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
        padding: const EdgeInsets.all(24.0), //espaco das bordas do celular
        child: Column(
          children: [
            const Text(
              'EM QUANTOS DIAS DESEJA SER AVISADO:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20), //espaco entre um elemento e outro

            Row( //deixa os elementos deitados
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //espaco igual entre botoes
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

            SwitchListTile( //on/off
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


  Widget _construirBotaoDia(int dias, String rotulo) { //botao dias
    bool estaSelecionado = _diasSelecionados == dias;

    return GestureDetector( //o container se torna clicavel
      onTap: () {
        setState(() {
          _diasSelecionados = dias;
        });

        ScaffoldMessenger.of(context).showSnackBar( //notificacao rapida
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
          borderRadius: BorderRadius.circular(16), //arredondamento das bordas do quadrado
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
