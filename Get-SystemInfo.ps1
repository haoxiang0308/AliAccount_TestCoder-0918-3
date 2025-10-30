function Get-SystemInfo {
    # Obtém informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OSDescription = (Get-CimInstance Win32_OperatingSystem).Caption
        OSVersion = (Get-CimInstance Win32_OperatingSystem).Version
        TotalPhysicalMemory = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
        FreePhysicalMemory = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory
        Processor = (Get-CimInstance Win32_Processor).Name
        TotalVisibleMemorySize = (Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize
        FreeSpaceInPagingFiles = (Get-CimInstance Win32_OperatingSystem).FreeSpaceInPagingFiles
        LastBootUpTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
        LocalDateTime = (Get-CimInstance Win32_OperatingSystem).LocalDateTime
    }

    # Converte as informações para formato legível
    $output = @"
Computer Name: $($systemInfo.ComputerName)
User Name: $($systemInfo.UserName)
OS Description: $($systemInfo.OSDescription)
OS Version: $($systemInfo.OSVersion)
Total Physical Memory: $( [math]::Round($systemInfo.TotalPhysicalMemory / 1MB, 2) ) MB
Free Physical Memory: $( [math]::Round($systemInfo.FreePhysicalMemory / 1MB, 2) ) MB
Processor: $($systemInfo.Processor)
Total Visible Memory: $( [math]::Round($systemInfo.TotalVisibleMemorySize / 1MB, 2) ) MB
Free Space in Paging Files: $( [math]::Round($systemInfo.FreeSpaceInPagingFiles / 1MB, 2) ) MB
Last Boot Time: $($systemInfo.LastBootUpTime)
Local Date Time: $($systemInfo.LocalDateTime)

"@


    # Gera um nome de arquivo aleatório
    $randomFileName = "SystemInfo_$(Get-Date -Format 'yyyyMMdd_HHmmss')_$((1000..9999 | Get-Random)).txt"
    
    # Salva as informações no arquivo
    $output | Out-File -FilePath $randomFileName -Encoding UTF8
    
    Write-Host "System information saved to: $randomFileName"
    return $randomFileName
}

# Chama a função
Get-SystemInfo