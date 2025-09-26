# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".csv"

# Получаем список процессов и экспортируем в CSV
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Список процессов сохранен в файл: $randomFileName"