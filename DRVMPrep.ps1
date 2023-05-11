# Install Hyper-V
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools

## Create folder for downlaods
 cd C:\
 mkdir Software
 cd C:\Software

 $url = "http://cdn.cloudbackup.management/maxdownloads/mxb-rc-windows-x64.exe"
 $ProgressPreference = 'SilentlyContinue'
 Invoke-WebRequest -uri $url -OutFile rc.exe
 $ProgressPreference = "Continue"

Start-Sleep -Seconds 30

Restart-Computer