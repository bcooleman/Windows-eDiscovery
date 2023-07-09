
<#
Credit: DFIR Matt's OISF Presentation @ https://github.com/cerkah/slides/blob/main/2023/OISF/These-Artifacts-aren't-Fiction.pdf
ChatGPT 4 generated - untested code...
.DESCRIPTION
This script demonstrates various system queries with PowerShell.

.USAGE
You can run this script by entering ./scriptname.ps1 in PowerShell. Replace 'scriptname' with the actual name of this script file.

.REQUIREMENTS
PowerShell version 5.1 or above

.NOT RUN
Commands that need more specification or 'Administrator' privileges. For instance:
- Get-FileHash: Get the file hash of a specific file (Requires file name).
- Get-Uptime -Since: Get the uptime of the system (Requires a timestamp).
- Get-Windows-Driver -Online -All: Get all drivers (Requires 'Administrator' privilege).
- OpenFiles /Local On: See local opened files (Requires 'Administrator' privilege and system restart).
#>

try {
    "Starting the transcript"
    Start-Transcript -Path "C:\temp\logfile.txt" -NoClobber
}
catch {
    Write-Host "Failed to start transcript. Error: $_"
}

try {
    "Printing the PowerShell version details"
    $PSVersionTable | Format-List -Property *
}
catch {
    Write-Host "Failed to get PS version details. Error: $_"
}

try {
    "Getting the current date and time"
    Get-Date | Format-List -Property *
}
catch {
    Write-Host "Failed to get date and time. Error: $_"
}

try {
    "Getting the current time zone"
    Get-TimeZone | Format-List -Property *
}
catch {
    Write-Host "Failed to get the time zone. Error: $_"
}

try {
    "Getting the OS last boot up time"
    Get-ComputerInfo -Property "OsLastBootUpTime" | Format-List -Property *
    "Getting the OS uptime"
    Get-ComputerInfo -Property "OsUptime" | Format-List -Property *
}
catch {
    Write-Host "Failed to get computer info. Error: $_"
}

try {
    $Time = Get-Date
    "Converting local time to Universal Time"
    $Time.ToUniversalTime() | Format-List -Property *
}
catch {
    Write-Host "Failed to convert local time to Universal Time. Error: $_"
}

try {
    "Getting network routes"
    Get-NetRoute | Format-List -Property *
    "Getting network neighbors"
    Get-NetNeighbor | Format-List -Property *
    "Getting TCP connections"
    Get-NetTCPConnection | Format-List -Property *
    "Getting UDP endpoints"
    Get-NetUDPEndpoint | Format-List -Property *
}
catch {
    Write-Host "Failed to get network information. Error: $_"
}

try {
    "Getting DNS client cache"
    Get-DnsClientCache | Format-List -Property *
}
catch {
    Write-Host "Failed to get DNS client cache. Error: $_"
}

try {
    "Getting local groups"
    Get-LocalGroup | Format-List -Property *
    "Getting local users"
    Get-LocalUser | Format-List -Property *
    "Getting child items in Users folder"
    Get-ChildItem C:\Users | Format-List -Property *
}
catch {
    Write-Host "Failed to get user information. Error: $_"
}

try {
    "Getting all processes"
    Get-Process | Format-List -Property *
    "Getting all services"
    Get-Service | Format-List -Property *
}
catch {
    Write-Host "Failed to get process and service information. Error: $_"
}

try {
    "Getting execution policy"
    Get-ExecutionPolicy | Format-List -Property *
    "Getting execution policy list"
    Get-ExecutionPolicy -List | Format-List -Property *
}
catch {
    Write-Host "Failed to get execution policy information. Error: $_"
}

try {
    "Getting clipboard content"
    Get-Clipboard | Format-List -Property *
}
catch {
    Write-Host "Failed to get clipboard content. Error: $_"
}

try {
    "Getting startup commands"
    Get-CimInstance Win32_StartupCommand | Format-List -Property *
    "Getting scheduled tasks"
    Get-ScheduledTask | Format-List -Property *
    "Getting installed patches"
    Get-HotFix | Format-List -Property *
    "Getting drives"
    Get-PSDrive | Format-List -Property *
    "Getting more computer info"
    Get-ComputerInfo | Format-List -Property *
}
catch {
    Write-Host "Failed to get system information. Error: $_"
}

try {
    "Stopping the transcript"
    Stop-Transcript
}
catch {
    Write-Host "Failed to stop transcript. Error: $_"
}
