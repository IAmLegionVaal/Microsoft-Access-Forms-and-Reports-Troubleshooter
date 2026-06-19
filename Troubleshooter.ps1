#requires -Version 5.1
<# Created by Dewald Pretorius #>
param([string]$OutputPath)
if(-not $OutputPath){$OutputPath="$([Environment]::GetFolderPath('Desktop'))\Access_Forms_Reports"};New-Item $OutputPath -ItemType Directory -Force|Out-Null
$events=Get-WinEvent -FilterHashtable @{LogName='Application';StartTime=(Get-Date).AddDays(-7)} -ErrorAction SilentlyContinue|Where-Object Message -match 'MSACCESS|expression|report|form|VBA'|Select-Object -First 50 TimeCreated,Id,ProviderName,Message
@('MICROSOFT ACCESS FORMS AND REPORTS TROUBLESHOOTER','Created by Dewald Pretorius',"Generated: $(Get-Date)",'Recent events:',($events|Format-List|Out-String -Width 220),'Guidance: verify record sources, missing references, control names, expressions, printer dependencies, fonts, VBA compile state, and trusted locations.')|Set-Content (Join-Path $OutputPath 'Report.txt') -Encoding UTF8