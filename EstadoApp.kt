/**
 * Classe selada para representar diferentes estados do aplicativo
 */
sealed class EstadoApp {
    /**
     * Estado quando os dados estão sendo carregados
     */
    object Carregando : EstadoApp()
    
    /**
     * Estado quando os dados foram carregados com sucesso
     */
    data class Sucesso(val dados: String) : EstadoApp()
    
    /**
     * Estado quando ocorreu um erro
     */
    data class Erro(val mensagem: String) : EstadoApp()
    
    /**
     * Estado quando não há dados para exibir
     */
    object Vazio : EstadoApp()
}

// Exemplo de uso da classe selada
fun exemploUso() {
    val estados: List<EstadoApp> = listOf(
        EstadoApp.Carregando,
        EstadoApp.Sucesso("Dados carregados com sucesso"),
        EstadoApp.Erro("Ocorreu um erro na operação"),
        EstadoApp.Vazio
    )
    
    estados.forEach { estado ->
        when (estado) {
            is EstadoApp.Carregando -> println("Carregando...")
            is EstadoApp.Sucesso -> println("Sucesso: ${estado.dados}")
            is EstadoApp.Erro -> println("Erro: ${estado.mensagem}")
            EstadoApp.Vazio -> println("Nenhum dado disponível")
        }
    }
}