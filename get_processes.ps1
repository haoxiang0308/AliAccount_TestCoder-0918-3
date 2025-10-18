# Получаем список процессов и сохраняем в файл со случайным именем
$processes = Get-Process
$randomFileName = "processes_$(Get-Random).txt"
$processes | Out-File -FilePath $randomFileName
Write-Host "Список процессов сохранен в файл: $randomFileName"