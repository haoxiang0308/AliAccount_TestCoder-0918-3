# Получить список процессов
$processes = Get-Process

# Сгенерировать случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".txt"

# Сохранить список процессов в файл
$processes | Out-File -FilePath $randomFileName

Write-Output "Список процессов сохранен в файл: $randomFileName"