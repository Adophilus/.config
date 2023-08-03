$OnViModeChange = [scriptblock]{
  if ($args[0] -eq 'Command')
  {
    # Set the cursor to a solid block.
    Write-Host -NoNewLine "`e[2 q"
  } else
  {
    # Set the cursor to a blinking line.
    Write-Host -NoNewLine "`e[5 q"
  }
}

# Shows navigable menu of all options when hitting Tab
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Auto complete commands just like bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# vim motions
Set-PSReadlineOption -EditMode vi
Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $OnViModeChange


Set-PSReadLineKeyHandler -Chord '"',"'" `
  -BriefDescription SmartInsertQuote `
  -LongDescription "Insert paired quotes if not already on a quote" `
  -ScriptBlock {
  param($key, $arg)

  $line = $null
  $cursor = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

  if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar)
  {
    # Just move the cursor
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
  } else
  {
    # Insert matching quotes, move cursor to be in between the quotes
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
  }
}

. ~\.config\powershell\vim\belotn\VIMBinding.ps1
