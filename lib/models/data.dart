class User {
  final String nome;
  final String email;
  final String telefone;
  final String cidade;
  final String uf;

  User({required this.nome, required this.email, required this.telefone, required this.cidade, required this.uf});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      cidade: json['endereco']['cidade'],
      uf: json['endereco']['uf'],
    );
  }
}