// Definindo um enum para demonstrar o uso de match
enum Status {
    Conectado,
    Desconectado,
    EmManutencao,
    Erro(String),
}

// Função que usa match para lidar com diferentes valores do enum
fn tratar_status(status: Status) -> String {
    match status {
        Status::Conectado => "Sistema está online e funcionando.".to_string(),
        Status::Desconectado => "Sistema está offline.".to_string(),
        Status::EmManutencao => "Sistema está em manutenção.".to_string(),
        Status::Erro(mensagem) => format!("Erro detectado: {}", mensagem),
    }
}

fn main() {
    // Exemplos de uso do enum com diferentes valores
    let status1 = Status::Conectado;
    let status2 = Status::Erro("Falha na conexão".to_string());
    let status3 = Status::EmManutencao;
    
    println!("{}", tratar_status(status1));
    println!("{}", tratar_status(status2));
    println!("{}", tratar_status(status3));
    
    // Salvando resultados em um arquivo
    use std::fs::File;
    use std::io::Write;
    
    let mut arquivo = File::create("resultado_enum.txt").expect("Falha ao criar arquivo");
    
    writeln!(arquivo, "{}", tratar_status(Status::Conectado)).expect("Falha ao escrever no arquivo");
    writeln!(arquivo, "{}", tratar_status(Status::Desconectado)).expect("Falha ao escrever no arquivo");
    writeln!(arquivo, "{}", tratar_status(Status::EmManutencao)).expect("Falha ao escrever no arquivo");
    writeln!(arquivo, "{}", tratar_status(Status::Erro("Erro crítico".to_string()))).expect("Falha ao escrever no arquivo");
    
    println!("Resultados salvos no arquivo resultado_enum.txt");
}