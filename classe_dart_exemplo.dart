class Pessoa {
  String nome;
  int idade;
  String? email;

  // Construtor padrão
  Pessoa(this.nome, this.idade, {this.email});

  // Construtor nomeado
  Pessoa.nomeado(this.nome) : idade = 0, email = null;

  // Outro construtor nomeado
  Pessoa.comIdade(this.nome, this.idade);

  @override
  String toString() {
    return 'Pessoa(nome: $nome, idade: $idade, email: $email)';
  }
}

void main() {
  // Exemplo de uso dos construtores
  var pessoa1 = Pessoa('João', 25);
  var pessoa2 = Pessoa.nomeado('Maria');
  var pessoa3 = Pessoa.comIdade('Pedro', 30);

  print(pessoa1);
  print(pessoa2);
  print(pessoa3);
}