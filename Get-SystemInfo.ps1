function Get-SystemInfo {
    <#
    .SYNOPSIS
        Obtém informações do sistema e salva em um arquivo com nome aleatório.
    
    .DESCRIPTION
        Esta função coleta várias informações do sistema como nome do computador,
        sistema operacional, arquitetura, uso de memória, disco rígido, etc., e
        salva essas informações em um arquivo de texto com um nome aleatório.
    
    .EXAMPLE
        Get-SystemInfo
        # Executa a função e salva as informações em um arquivo com nome aleatório
    #>
    
    # Coletando informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OperatingSystem = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        OSVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version
        Architecture = (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture
        TotalPhysicalMemory = [math]::Round((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
        FreePhysicalMemory = [math]::Round([decimal](Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2)
        TotalVirtualMemory = [math]::Round((Get-WmiObject -Class Win32_OperatingSystem).TotalVirtualMemorySize / 1MB, 2)
        FreeVirtualMemory = [math]::Round((Get-WmiObject -Class Win32_OperatingSystem).FreeVirtualMemory / 1MB, 2)
        Processor = (Get-WmiObject -Class Win32_Processor).Name
        TotalDiskSpace = [math]::Round((Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'").Size / 1GB, 2)
        FreeDiskSpace = [math]::Round((Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / 1GB, 2)
        LastBootTime = (Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime
        CurrentDateTime = Get-Date
    }
    
    # Gerando um nome de arquivo aleatório
    $randomFileName = "SystemInfo_$(Get-Random -Maximum 99999999).txt"
    
    # Convertendo as informações para texto formatado
    $output = "Informações do Sistema - $(Get-Date)`n"
    $output += "=" * 50 + "`n"
    
    foreach ($key in $systemInfo.Keys) {
        $output += "$key`: $($systemInfo[$key])`n"
    }
    
    # Salvando as informações no arquivo
    $output | Out-File -FilePath $randomFileName -Encoding UTF8
    
    Write-Host "Informações do sistema salvas em: $randomFileName"
    Write-Output $randomFileName
}

# Chamar a função para testar
Get-SystemInfo