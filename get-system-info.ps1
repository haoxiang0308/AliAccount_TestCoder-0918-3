# Função PowerShell para obter informações do sistema e salvar em um arquivo com nome aleatório
function Get-SystemInfo {
    # Obtém várias informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OS = (Get-CimInstance Win32_OperatingSystem).Caption
        OSVersion = (Get-CimInstance Win32_OperatingSystem).Version
        Architecture = (Get-CimInstance Win32_OperatingSystem).OSArchitecture
        TotalPhysicalMemory = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
        FreePhysicalMemory = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory
        Processor = (Get-CimInstance Win32_Processor).Name -join ', '
        TotalVisibleMemorySize = (Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize
        LastBootUpTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
        LocalTime = (Get-CimInstance Win32_OperatingSystem).LocalDateTime
        DiskInfo = Get-CimInstance Win32_LogicalDisk | Select-Object DeviceID, Size, FreeSpace
    }
    
    # Gera um nome de arquivo aleatório
    $randomFileName = "SystemInfo_$(Get-Random -Maximum 99999).txt"
    
    # Converte as informações para string formatada
    $output = "System Information Report`n"
    $output += "Generated on: $(Get-Date)`n"
    $output += "=" * 50 + "`n"
    
    foreach ($key in $systemInfo.Keys) {
        if ($key -eq "DiskInfo") {
            $output += "$key :`n"
            foreach ($disk in $systemInfo[$key]) {
                $sizeGB = [math]::Round($disk.Size / 1GB, 2)
                $freeGB = [math]::Round($disk.FreeSpace / 1GB, 2)
                $output += "  $($disk.DeviceID) - Size: ${sizeGB}GB, Free: ${freeGB}GB`n"
            }
        } else {
            $output += "$key : $($systemInfo[$key])`n"
        }
    }
    
    # Salva as informações no arquivo com nome aleatório
    $output | Out-File -FilePath $randomFileName -Encoding UTF8
    
    Write-Host "System information saved to: $randomFileName"
    return $randomFileName
}

# Chama a função
Get-SystemInfo