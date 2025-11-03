enum StatusUsuario {
    case logado(usuarioID: Int, nome: String)
    case visitante(sessaoID: String)
    case bloqueado(motivo: String, dataExpiracao: String)
}

// Exemplo de uso:
let status1 = StatusUsuario.logado(usuarioID: 123, nome: "João Silva")
let status2 = StatusUsuario.visitante(sessaoID: "abc123xyz")
let status3 = StatusUsuario.bloqueado(motivo: "Violação de termos", dataExpiracao: "2023-12-31")

print(status1)
print(status2)
print(status3)