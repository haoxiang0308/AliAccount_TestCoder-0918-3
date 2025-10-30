function Get-SystemInfo {
    # Obtém informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OS = (Get-CimInstance Win32_OperatingSystem).Caption
        OSVersion = (Get-CimInstance Win32_OperatingSystem).Version
        TotalPhysicalMemory = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
        FreePhysicalMemory = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory
        Processor = (Get-CimInstance Win32_Processor).Name -join ', '
        TotalVisibleMemorySize = (Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize
        FreeSpaceInPagingFiles = (Get-CimInstance Win32_OperatingSystem).FreeSpaceInPagingFiles
        LastBootUpTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
        LocalDateTime = (Get-CimInstance Win32_OperatingSystem).LocalDateTime
    }

    # Gera um nome de arquivo aleatório
    $randomFileName = "SystemInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000) + ".txt"
    
    # Caminho completo do arquivo
    $filePath = Join-Path $PWD $randomFileName

    # Converte as informações para string e salva no arquivo
    $content = "=== Informações do Sistema ===`n"
    $content += "Data/Hora: $(Get-Date)`n`n"
    
    foreach ($key in $systemInfo.Keys) {
        $content += "$key`: $($systemInfo[$key])`n"
    }

    # Escreve o conteúdo no arquivo
    Set-Content -Path $filePath -Value $content
    
    Write-Host "Informações do sistema salvas em: $filePath"
    
    # Retorna o caminho do arquivo
    return $filePath
}

# Chama a função
Get-SystemInfo