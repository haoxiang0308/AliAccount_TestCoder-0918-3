# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 99999) + ".csv"

# Получаем список процессов и экспортируем в CSV файл со случайным именем
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Список процессов сохранен в файл: $randomFileName"