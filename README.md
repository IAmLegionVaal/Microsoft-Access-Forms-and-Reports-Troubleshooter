# Microsoft Access Forms and Reports Troubleshooter

Created by **Dewald Pretorius**.

The repository includes the original forms, reports, controls, expressions, macro, and rendering diagnostics plus a guarded `Repair.ps1` helper.

Supported actions are `Diagnose`, `ResetOfficeCache`, and `RepairOffice`.

```powershell
.\Repair.ps1 -Action Diagnose
.\Repair.ps1 -Action ResetOfficeCache -WhatIf
.\Repair.ps1 -Action RepairOffice -Confirm
```

Close Access before cache repair. Existing cache data is preserved as a timestamped backup. Source-reviewed for PowerShell 5.1; not runtime-tested against every database or Office build.
