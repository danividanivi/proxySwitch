#Requires -RunAsAdministrator

if ([Environment]::GetEnvironmentVariable('http_proxy', 'Machine') -ne "http://proxyed.rd1.rf1:8080") {
    Write-Host "Before running this script, your system http_proxy and https_proxy was unset."
    Write-Host "Changing to http://proxyed.rd1.rf1:8080..."
    [Environment]::SetEnvironmentVariable('http_proxy', 'http://proxyed.rd1.rf1:8080', 'Machine')
    [Environment]::SetEnvironmentVariable('https_proxy', 'http://proxyed.rd1.rf1:8080', 'Machine')
    Write-Host "Your http_proxy and https_proxy is now: $([Environment]::GetEnvironmentVariable('http_proxy', 'Machine'))"
}
else {
    Write-Host "Before running this script, your system http_proxy and https_proxy was: $([Environment]::GetEnvironmentVariable('http_proxy', 'Machine'))."
    Write-Host "Removing proxy..."
    [Environment]::SetEnvironmentVariable('http_proxy', $null, 'Machine')
    [Environment]::SetEnvironmentVariable('https_proxy', $null, 'Machine')
    Write-Host "Your http_proxy and https_proxy is now unset."
}

$Env:http_proxy = [System.Environment]::GetEnvironmentVariable('http_proxy', 'Machine')
$Env:https_proxy = [System.Environment]::GetEnvironmentVariable('https_proxy', 'Machine')
Write-Host "Your current shell/IDE environment variables have also been updated, remember to restart others if required"
Read-Host -Prompt "Press Enter to exit"