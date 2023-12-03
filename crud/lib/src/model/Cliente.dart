class Cliente {
  int? id;
  String? nome;
  String? sobrenome;
  String? email;
  int? idade;
  String? foto;

  Cliente({
    this.id,
    this.nome,
    this.sobrenome,
    this.email,
    this.idade,
    this.foto,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'idade': idade,
      'foto': foto,
    };
  }
}