# this is windows environment install script
# mainly using choco
#memo Start-Process powershell.exe -Verb runas
powershell start-process "powershell 'choco install chromium'" -verb runas
