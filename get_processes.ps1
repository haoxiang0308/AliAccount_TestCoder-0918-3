# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".txt"

# Получаем список процессов и сохраняем в файл со случайным именем
Get-Process | Out-File -FilePath $randomFileName

Write-Output "Список процессов сохранен в файл: $randomFileName"