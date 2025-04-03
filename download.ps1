$url = "https://download.microsoft.com/download/e/6/4/e6477a2a-9b58-40f7-8ad6-62bb8491ea78/SQLServerReportingServices.exe"

$rutaActual = Get-Location

$archivo = "SQLServerReportingServices.exe"

$rutaCompleta = Join-Path -Path $rutaActual -ChildPath $archivo

Invoke-WebRequest -Uri $url -OutFile $rutaCompleta

Write-Host "Descarga completada: $rutaCompleta"
