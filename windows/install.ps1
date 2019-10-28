# this is windows environment install script
# mainly using choco
#memo Start-Process powershell.exe -Verb runas

#chromium is not enabled chrome account sync therefore use google chrome
#powershell start-process "powershell 'choco install chromium'" -verb runas
powershell start-process "powershell 'choco install googlechrome -y'" -verb runas
powershell start-process "powershell 'choco install cmder -y'" -verb runas
powershell start-process "powershell 'choco install nodist -y'" -verb runas
powershell start-process "powershell 'cinst visualstudiocode -y'" -verb runas
