class Vacancies {
  late int id;
  late String nome;
  late bool ocupada;

  Vacancies({required this.id, required this.nome, required this.ocupada});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'ocupada': ocupada ? 1 : 0,
      'id': id,
    };
  }

  Vacancies.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    nome = map['nome'] ?? "";
    ocupada = map['ocupada'] == 1;
  }
}
