Set-PSReadLineKeyHandler -Chord "Alt+k" -ViMode Insert `
  -ScriptBlock { 
		param($Key, $Arg)
		$Level = 1
		[Microsoft.PowerShell.PSConsoleReadLine]::TryGetArgAsInt($Arg, `
      [ref]$Level,1)
		Set-Location -Path (( 1..$Level | ForEach-Object { '..'}) -join '\') } `
  -Description "Move to Parent Directory"
Set-PSReadLineKeyHandler -Chord "Alt+k" -ViMode Command `
  -ScriptBlock { 
		param($Key, $Arg)
		$Level = 1
		[Microsoft.PowerShell.PSConsoleReadLine]::TryGetArgAsInt($Arg, `
      [ref]$Level,1)
		Set-Location -Path (( 1..$Level | ForEach-Object { '..'}) -join '\') } `
  -Description "Move to Parent Directory"
Set-PSReadLineKeyHandler -Chord "Alt+j" -VIMode Insert `
  -ScriptBlock {
		$Cursor = $Null
		$Line = $Null
		[Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$Line,`
      [ref]$Cursor)
		(Get-Childitem "$Line*" -Attribute Directory )[0].FullName | Set-Location
}

if($PSVersionTable.PSVersion.Major -eq 7)
{
  Set-PSReadLineKeyHandler -Chord "Alt+l" -VIMode Insert `
    -ScriptBlock { Set-Location + } -Description "Move to the next directory in history"
  Set-PSReadLineKeyHandler -Chord "Alt+h" -VIMode Insert `
    -ScriptBlock { Set-Location - } -Description "Move to the previous directory in history"
  Set-PSReadLineKeyHandler -Chord "Alt+l" -VIMode Command `
    -ScriptBlock { 
    param($Key, $Arg)
    [int]$Level = 1
    [Microsoft.PowerShell.PSConsoleReadLine]::TryGetArgAsInt($Arg, `
        [ref]$Level,1)
    for($i=0;$i -lt $Level; $i++)
    { Set-Location + 
    }
  } -Description "Move to the next directory in history"
  Set-PSReadLineKeyHandler -Chord "Alt+h" -VIMode Command `
    -ScriptBlock {
    param($Key, $Arg)
    [int]$Level = 1
    [Microsoft.PowerShell.PSConsoleReadLine]::TryGetArgAsInt($Arg, `
        [ref]$Level,1)

    for($i=0;$i -lt $Level; $i++)
    { Set-Location - 
    }
  } -Description "Move to the previous directory in history"
}
