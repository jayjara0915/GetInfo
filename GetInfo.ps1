$computerSystem = Get-WmiObject Win32_ComputerSystem | Select-Object Manufacturer, Model, SerialNumber
$wirelessAdapter = Get-WmiObject Win32_NetworkAdapter | Where-Object { $_.Name -like "*Wi-Fi*" -and $_.MACAddress -ne $null } | Select-Object MACAddress
$physicalAdapter = Get-WmiObject Win32_NetworkAdapter | Where-Object { $_.MACAddress -ne $null } | Select-Object MACAddress

$manufacturer = $computerSystem.Manufacturer
$model = $computerSystem.Model
$serialNumber = $computerSystem.SerialNumber

if ($wirelessAdapter) {
    $wirelessMAC = $wirelessAdapter.MACAddress
} else {
    $wirelessMAC = "N/A"
}

if ($physicalAdapter) {
    $physicalMAC = $physicalAdapter.MACAddress
} else {
    $physicalMAC = "N/A"
}

Write-Host "Manufacturer: $manufacturer"
Write-Host "Model: $model"
Write-Host "Serial Number: $serialNumber"
Write-Host "WiFi Wireless MAC Address: $wirelessMAC"
Write-Host "Physical MAC Address: $physicalMAC"
