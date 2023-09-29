$confirmation = Read-Host "Do you want to run startup script? (y/n)"
if ($confirmation -eq 'y')
{
  Write-Host "Starting up komorebi..."
  Komorebi-Start

  Write-Host "Starting up yasb..."
  Yasb-Start

  Write-Host "Starting up kanata..."
  Kanata-Start
}
