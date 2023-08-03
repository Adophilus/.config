# By heycli.com
# License: Any kind of usage of this file is allowed 

$PROD_API_ENDPOINT = "https://api.heycli.com"
$HEYCLI_API_KEY = $env:HEYCLI_API_KEY
# $LOCAL_API_ENDPOINT = "http://127.0.0.1:8080"
# $REMOTE_SCRIPT = "https://raw.githubusercontent.com/HeyCLI/heyCLI_client/main/heycli_client.sh"

$API_END_POINT = $PROD_API_ENDPOINT;

function hey()
{
  # $remoteScript = $REMOTE_SCRIPT
  # Check if the heycli_client.sh file exists
  # if (Test-Path "~/.heycli_client.sh") {
  #   # Check if the file is up to date
  #   $localScript = "~/.heycli_client.sh"
  #   if (Get-Content $localScript -Raw | Compare-Object -ReferenceObject (Invoke-WebRequest -Uri $remoteScript -Method Get -UseBasicParsing).Content -Sync -Quiet) {
  #     # The file is up to date, do nothing
  #     return
  #   }
  # }

  # Download the heycli_client.sh file
  # Invoke-WebRequest -Uri $remoteScript -OutFile "~/.heycli_client.sh"

  # Source the heycli_client.sh file
  # . "~/.heycli_client.sh"

  # Check if the user wants to update the heycli_client.sh file
  # if ($args[0] -eq "update" -and $args.Count -eq 1) {
  #   Write-Host "Updating HeyCLI client..."
  #   Invoke-WebRequest -Uri $remoteScript -OutFile "~/.heycli_client.sh"
  #   . "~/.heycli_client.sh"
  #   Write-Host "HeyCLI client updated successfully"
  #   return
  # }

  # Check if the user wants help
  if ($args[0] -eq "help" -and $args.Count -eq 1)
  {
    Write-Host "HeyCLI client"
    Write-Host "Usage: hey <query in natural langauge>"
    Write-Host "Examples:"
    Write-Host "hey list files"
    Write-Host "hey list git commits of last 2 days"
    Write-Host "hey what GKE region is used by my cluster"
    Write-Host "hey ping google.com"
    Write-Host "hey write a file with name test.txt and content \"Hello World\""
    Write-Host "hey create a dockerfile with base image ubuntu and expose port 80"
    Write-Host "For more information visit: $GITHUB_REPO_URL"
    return
  }

  # Check if the user wants to setup the heycli_client.sh file
  if ($args[0] -eq "setup" -and $args.Count -eq 1)
  {
    $history = Get-History | Select-Object -ExpandProperty Command
    $history | Out-File "~/.hist.txt"
    $histfile = "~/.hist.txt"
    $current_dir = Get-Location
    $headers = @{Authorization = "Bearer $HEYCLI_API_KEY"}
    Invoke-WebRequest -Uri $API_END_POINT/setup -Method Post -Headers $headers -InFile $histfile
    return
  }

  # Get the user's command
  $cmd = $args[0]
  # $args = $args[1..($args.Count - 1)]

  # Get the user's current directory
  $current_dir = Get-Location

  # Send the command to the HeyCLI API
  $headers = @{Authorization = "Bearer $HEYCLI_API_KEY"}
  $data = @{
    command = $cmd
    recent_history = "~/.recent_hist.txt"
    curr_dir = $current_dir
  }
  Invoke-WebRequest -Uri $API_END_POINT/heycli -Method Post -Headers $headers -Body $data

  # Get the answer from the HeyCLI API
  $answer = Invoke-WebRequest -Uri $API_END_POINT/get_answer -Method Get -Headers $headers

  # Write the answer to the console
  Write-Host "Answer: $answer"
}
