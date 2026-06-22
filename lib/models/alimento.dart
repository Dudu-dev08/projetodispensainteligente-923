class Alimento {
  int? id;
  String nome;
  String validade;
  String status;

  Alimento({this.id, required this.nome, required this.validade, required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'validade': validade,
      'status': status,
    };
  }

  factory Alimento.fromMap(Map<String, dynamic> map) {
    return Alimento(
      id: map['id'],
      nome: map['nome'],
      validade: map['validade'],
      status: map['status'],
    );
  }
}
