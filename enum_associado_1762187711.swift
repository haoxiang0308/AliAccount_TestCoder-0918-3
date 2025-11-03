// Enum Swift com casos associados
enum Resultado<T> {
    case sucesso(T)
    case falha(String)
    case carregando(Progresso)
}

struct Progresso {
    let atual: Int
    let total: Int
}

// Exemplo de uso
let resultado = Resultado.sucesso("Operação concluída com sucesso!")
let erro = Resultado.falha("Ocorreu um erro inesperado")
let carregando = Resultado.carregando(Progresso(atual: 50, total: 100))

// Demonstração de como lidar com os diferentes casos
func lidarComResultado<T>(_ resultado: Resultado<T>) {
    switch resultado {
    case .sucesso(let valor):
        print("Sucesso: \(valor)")
    case .falha(let mensagem):
        print("Falha: \(mensagem)")
    case .carregando(let progresso):
        print("Carregando: \(progresso.atual)/\(progresso.total)")
    }
}

// Testando a função
lidarComResultado(resultado)
lidarComResultado(erro)
lidarComResultado(carregando)