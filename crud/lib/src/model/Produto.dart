class Produto {
  int? id;
  String? nome;
  String? descricao;
  double? preco;
  DateTime? dataAtualizado;

  Produto({
    this.id,
    this.nome,
    this.descricao,
    this.preco,
    this.dataAtualizado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
      'dataAtualizado': dataAtualizado,
    };
  }
}