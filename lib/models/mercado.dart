class Mercado {
  int? id;
  String nome;
  String endereco;

  Mercado({this.id, required this.nome, required this.endereco});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'endereco': endereco,
    };
  }

  factory Mercado.fromMap(Map<String, dynamic> map) {
    return Mercado(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
    );
  }
}
