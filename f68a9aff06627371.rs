// Definindo um enum para demonstrar o uso de match
#[derive(Debug)]
enum Valor {
    Numero(i32),
    Texto(String),
    Booleano(bool),
    Nulo,
}

// Função que demonstra o uso de match com diferentes valores do enum
fn processar_valor(valor: Valor) -> String {
    match valor {
        Valor::Numero(n) => format!("Recebido um número: {}", n),
        Valor::Texto(s) => format!("Recebido um texto: '{}'", s),
        Valor::Booleano(b) => {
            if b {
                "Recebido um valor booleano verdadeiro".to_string()
            } else {
                "Recebido um valor booleano falso".to_string()
            }
        },
        Valor::Nulo => "Recebido um valor nulo".to_string(),
    }
}

fn main() {
    // Exemplos de uso do enum com diferentes valores
    let valores = vec![
        Valor::Numero(42),
        Valor::Texto("Olá, Rust!".to_string()),
        Valor::Booleano(true),
        Valor::Booleano(false),
        Valor::Nulo,
    ];

    println!("Demonstração do uso de match com enum em Rust:\n");
    
    for valor in valores {
        let resultado = processar_valor(valor);
        println!("{}", resultado);
    }
}