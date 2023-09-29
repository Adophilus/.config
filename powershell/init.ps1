. ~\.env.ps1

$env:PNPM_HOME = "$HOME\.pnpm"
$env:PATH += ";$env:PNPM_HOME"
$env:CARGO_BIN = "$HOME\.cargo\bin"
$env:PATH += ";$env:CARGO_BIN"
$env:EDITOR = $env:VISUAL = "nvim"
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"

# Set the cursor to a blinking line
Write-Host -NoNewLine "`e[5 q"

Set-Alias -Name python3 -Value python

. ~\.config\powershell\chocolatey\init.ps1
. ~\.config\powershell\deno\init.ps1
. ~\.config\powershell\docker\init.ps1
. ~\.config\powershell\vim\init.ps1
. ~\.config\powershell\hey\init.ps1
. ~\.config\powershell\kanata\init.ps1
. ~\.config\powershell\komorebi\init.ps1
. ~\.config\powershell\yasb\init.ps1

oh-my-posh init pwsh --config  "$(scoop prefix oh-my-posh)\themes\robbyrussell.omp.json" | Invoke-Expression
