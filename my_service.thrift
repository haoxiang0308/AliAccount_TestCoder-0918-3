// Definição de um serviço Thrift com métodos de RPC
namespace java com.example.service
namespace py my_service

// Definição de uma estrutura de exemplo
struct User {
  1: i32 id,
  2: string name,
  3: string email
}

// Definição de exceção
exception UserNotFoundException {
  1: string message
}

// Definição do serviço com métodos de RPC
service MyService {
  // Método para obter um usuário pelo ID
  User getUser(1: i32 userId) throws (1: UserNotFoundException e),
  
  // Método para criar um novo usuário
  bool createUser(1: User user),
  
  // Método para atualizar um usuário existente
  bool updateUser(1: User user) throws (1: UserNotFoundException e),
  
  // Método para deletar um usuário
  bool deleteUser(1: i32 userId) throws (1: UserNotFoundException e),
  
  // Método para obter todos os usuários
  list<User> getAllUsers(),
  
  // Método ping para testar a conexão
  string ping(),
  
  // Método para obter estatísticas
  map<string, i64> getStats()
}