Set-PSReadLineKeyHandler -VIMode Command -Key  $(@{$False="\";$True=$EditKey}[$(Test-Path Variable:EditKey)]) -ScriptBlock {
  if( Get-Command $EDITOR)
  { 
    # Grab BufferLine
    $Line = $Null
    $Cursor = $Null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$Line, [ref]$Cursor)
    # Launch Editor with temporary file
    $File = New-TemporaryFile
    Set-Content -Path $File -Value $Line
    Start-Process -wait $EDITOR -ArgumentList $File -NoNewWindow
    $Line = get-content $File
    # Write Command at prompt
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    $Line | ForEach-Object {
      [Microsoft.Powershell.PSConsoleReadLine]::Insert( $_.replace("`t",'  ') + "`n" ) 
    }
    Remove-Item $File
  } else
  {
    throw [System.IO.FileNotFoundException] "$Editor not found."
  }
}
