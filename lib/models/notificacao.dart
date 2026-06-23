class Notificacao {
  int? id;
  String titulo;
  String data;
  String mensagem;

  Notificacao({this.id, required this.titulo, required this.data, required this.mensagem});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'data': data,
      'mensagem': mensagem,
    };
  }

  factory Notificacao.fromMap(Map<String, dynamic> map) {
    return Notificacao(
      id: map['id'],
      titulo: map['titulo'],
      data: map['data'],
      mensagem: map['mensagem'],
    );
  }
}
