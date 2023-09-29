function Bun-Start ()
{
  $extraArgs = $Args | join-string -sep ' '
  $arguments = @("run", "--workdir", "/home/bun", "--volume", ".:/home/bun", "-p", "8080:8080", "--interactive", "--tty", "--rm", "oven/bun:latest")
  foreach ($extraArg in $extraArgs) {
    $arguments += $extraArg
  }
  Start-Process docker -NoNewWindow -Wait -ArgumentList $arguments
}

Set-Alias -Name bun -Value Bun-Start 
