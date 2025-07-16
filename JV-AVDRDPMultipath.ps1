# Justin Verstijnen Enable RDP Multipath on AVD Session Hosts script
# Github page: https://github.com/JustinVerstijnen/JV-AVDRDPMultipath
# Let's start!
Write-Host "Script made by..." -ForegroundColor DarkCyan
Write-Host "     _           _   _        __     __            _   _  _                  
    | |_   _ ___| |_(_)_ __   \ \   / /__ _ __ ___| |_(_)(_)_ __   ___ _ __  
 _  | | | | / __| __| | '_ \   \ \ / / _ \ '__/ __| __| || | '_ \ / _ \ '_ \ 
| |_| | |_| \__ \ |_| | | | |   \ V /  __/ |  \__ \ |_| || | | | |  __/ | | |
 \___/ \__,_|___/\__|_|_| |_|    \_/ \___|_|  |___/\__|_|/ |_| |_|\___|_| |_|
                                                       |__/                  " -ForegroundColor DarkCyan

# === PARAMETERS ===
$AvdMultipathReg = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RdpCloudStackSettings"
$valueName = "SmilesV3ActivationThreshold"
$valueData = 256 # 256 means enabled, 0 means disabled.
# === END PARAMETERS ===

# Step 1: Check if the registry key exists and creates it
if (-not (Test-Path $AvdMultipathReg)) {
    New-Item -Path $AvdMultipathReg -Force | Out-Null
}

# Step 2: Add or update the DWORD value
New-ItemProperty -Path $AvdMultipathReg -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null
Write-Host "Registry value $valueName has been set to $valueData in $AvdMultipathReg" -ForegroundColor Green
