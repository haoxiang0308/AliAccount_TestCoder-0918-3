/**
 * Classe selada para representar diferentes estados em um aplicativo
 */
sealed class EstadoApp {
    object Carregando : EstadoApp()
    object Sucesso : EstadoApp()
    object Erro : EstadoApp()
    data class Dados(val mensagem: String) : EstadoApp()
}