import 'package:flutter/material.dart'; // importa o pacote principal de design do fluter (aterial design)
import 'compras_faltantes_delivery.dart'; // importa o arquivo da outra tela para onde o botão vai navegar

class TelaListagemAlimentos extends StatelessWidget { // define uma tela "estática" (sem movimento de início)
  const TelaListagemAlimentos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( // scaffold é o esqueleto da tela
      backgroundColor: Colors.white, // cor de fundo da tela inteira
      appBar: AppBar( // barra título no topo
        titleSpacing: 0, // remove o espaçamento padrão ao redor do titulo
        backgroundColor: const Color(0xFF1E00C8), // azul escuro da barra superior
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('LISTA DE ALIMENTOS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true, // centraliza o título no android e ios
      ),
      body: Column( // column organiza os elementos de cima para baixo (o corpo da tela)
        children: [
          // seção de pesquisa
          Padding( // preenchimento; estofado
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                //variável de propriedade
                borderRadius: BorderRadius.circular(24), //bordas arredondadas (pilula)
                border: Border.all(color: Colors.grey.shade400),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))
                ],
              ),
              child: const TextField( // campo onde o usuário digita
                decoration: InputDecoration(
                  border: InputBorder.none, // remove a linha padrão do flutter
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: Icon(Icons.search, color: Colors.black87), // ícone de lupa no final
                ),
              ),
            ),
          ),
          // lista de itens expandíveis
          Expanded( // usado para que a lista ocupe o resto da tela
            child: ListView( // permite a rolagem da tela
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // chamada da função para não repetir código
                // variável auxiliar
                _construirItemLista('LEITE INTEGRAL', 'NA VALIDADE\nVENCE EM 15/06/2026', const Color(0xFF00C853)),
                _construirItemLista('ARROZ', 'NA VALIDADE\nVENCE EM 30/12/2026', const Color(0xFF00C853)),
                _construirItemLista('FLOCOS DE MILHO', 'PERTO DA VALIDADE\nVENCE EM 7 DIAS', Colors.grey.shade400, corTexto: Colors.white),
                _construirItemLista('CEREAL', 'VENCIDO\nVENCE EM 01/01/2026', const Color(0xFFFF3D00)),
              ],
            ),
          ),
        ],
      ),
      // botão flutuante para ir para a tela de compras
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E00C8),
        onPressed: () { // o que acontece quando o usuário clica
          // comando para mudar de tela
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

  // função auxiliar: cria o design de cada item da lista (card)
  Widget _construirItemLista(String titulo, String subtitulo, Color corFundo, {Color corTexto = Colors.white}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8), // espaço entre um card e outro
      decoration: BoxDecoration(
        color: corFundo, // cor que indica o status (verde, cinza ou vermelho)
        border: Border.all(color: Colors.black87, width: 2), // borda preta fina
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row( // organiza os textos e o quadradinho branco na horizontal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column( // organiza o título a a validade na vertical
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo, style: TextStyle(color: corTexto, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8), // espaço entre o título entre a validade
                  Align(
                    alignment: Alignment.centerRight, // alinha o texto de validade à direita
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
            // quadrado branco lateral
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
