class ItemCompra {
  int? id;
  String nome;
  int quantidade;

  ItemCompra({this.id, required this.nome, required this.quantidade});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'quantidade': quantidade,
    };
  }

  factory ItemCompra.fromMap(Map<String, dynamic> map) {
    return ItemCompra(
      id: map['id'],
      nome: map['nome'],
      quantidade: map['quantidade'],
    );
  }
}
