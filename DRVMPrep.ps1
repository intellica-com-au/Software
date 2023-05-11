# Install Hyper-V
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools

## Create folder for downlaods
Set-Location C:\Users\Intellica\Desktop

 $url = "http://cdn.cloudbackup.management/maxdownloads/mxb-rc-windows-x64.exe"
 $ProgressPreference = 'SilentlyContinue'
 Invoke-WebRequest -uri $url -OutFile rc.exe
 $ProgressPreference = "Continue"

## Initialize and format our virtual disk to hold the virtual disaster recover install files
get-disk | Where-Object PartitionStyle -eq 'raw' | sort number | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -UseMaximumSize -DriveLetter F | Format-Volume -FileSystem NTFS -NewFileSystemLabel "Restore Data" -Confirm

#R

Start-Sleep -Seconds 30

Restart-Computer