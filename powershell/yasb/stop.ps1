$yasbProcess = Get-Process python -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -Like "*yasb*" } | Select-Object -First 1

Write-Output $yasbProcess

if ($null -ne $yasbProcess)
{
  Write-Ouput $yasbProcess.id
  Stop-Process -Id $yasbProcess.Id
}
