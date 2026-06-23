class Notificacao {
  int? id;
  String titulo;
  String data;
  String mensagem;

  Notificacao({this.id, required this.titulo, required this.data, required this.mensagem}); //construtor da classe

  Map<String, dynamic> toMap() { //dicionario de chave e valor; flutter>bd
    return { //retorna os valores
      'id': id,
      'titulo': titulo,
      'data': data,
      'mensagem': mensagem,
    };
  }

  factory Notificacao.fromMap(Map<String, dynamic> map) { //inverso da anterior
    return Notificacao(
      id: map['id'],
      titulo: map['titulo'],
      data: map['data'],
      mensagem: map['mensagem'],
    );
  }
}
