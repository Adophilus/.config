$yasbProcess = Get-Process python -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -Like "*yasb*" } | Select-Object -First 1

if ($null -ne $yasbProcess)
{
  Stop-Process -Id $yasbProcess.Id
}
