# Descrição do Script PowerShell

O arquivo `get-system-info.ps1` contém uma função PowerShell que:

1. Obtém várias informações do sistema, incluindo:
   - Nome do computador
   - Nome de usuário
   - Sistema operacional e versão
   - Arquitetura do sistema
   - Memória física total e livre
   - Informações do processador
   - Informações sobre discos rígidos

2. Gera um nome de arquivo aleatório no formato `SystemInfo_[número_aleatório].txt`

3. Formata todas as informações em um relatório legível

4. Salva as informações no arquivo com nome aleatório

5. Exibe uma mensagem confirmando onde as informações foram salvas

A função utiliza o cmdlet `Get-CimInstance` para obter informações detalhadas do sistema e `Get-Random` para gerar o número aleatório no nome do arquivo.

Para executar este script, você precisaria de um sistema Windows com PowerShell ou PowerShell Core instalado.