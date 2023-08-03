Start-Process powershell -ArgumentList "Yasb-Start" -WindowStyle hidden
Set-Location "$HOME\projects\tools\yasb"
.\.venv\Scripts\activate
python3 .\src\main.py
