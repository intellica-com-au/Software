# Install Hyper-V
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools

#Set our time/zone info
Set-TimeZone "E. Australia Standard Time"
Set-WinSystemLocale -SystemLocal en-AU

## Navigate to Intellica Desktop
Set-Location C:\Users\Intellica\Desktop

# Download RC
 $url = "http://cdn.cloudbackup.management/maxdownloads/mxb-rc-windows-x64.exe"
 $ProgressPreference = 'SilentlyContinue'
 Invoke-WebRequest -uri $url -OutFile rc.exe
 $ProgressPreference = "Continue"

## Initialize and format our virtual disk to hold the virtual disaster recover install files
get-disk | Where-Object PartitionStyle -eq 'raw' | sort number | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -UseMaximumSize -DriveLetter F | Format-Volume -FileSystem NTFS -NewFileSystemLabel "Restore Data" -Confirm

# wait for 60 seconds - ensures disk is initilised and everything is completed before restarting the device
Start-Sleep -Seconds 60

#Restart Computer
Restart-Computer