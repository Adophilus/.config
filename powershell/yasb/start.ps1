Set-Location "$HOME\projects\tools\yasb"
.\.venv\Scripts\activate
Start-Process python3 -ArgumentList .\src\main.py -WindowStyle Hidden
