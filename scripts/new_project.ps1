param(
    [Parameter(Mandatory=$true)][string]$ProjectName,
    [Parameter(Mandatory=$true)][string]$Destination
)
$ErrorActionPreference = "Stop"
$TemplateDir = Split-Path -Parent $PSScriptRoot
$NewProjectPath = Join-Path $Destination $ProjectName
if (Test-Path $NewProjectPath) {
    Write-Error "Error: $NewProjectPath already exists."
    exit 1
}
Write-Host "Creating $NewProjectPath from template at $TemplateDir ..."
New-Item -ItemType Directory -Path $NewProjectPath | Out-Null
Copy-Item -Path (Join-Path $TemplateDir "*") -Destination $NewProjectPath -Recurse -Force -Exclude ".git"
(Get-Content (Join-Path $NewProjectPath "README.md")) -replace '\[NOMBRE DEL PROYECTO\]', $ProjectName | Set-Content (Join-Path $NewProjectPath "README.md")
(Get-Content (Join-Path $NewProjectPath "CHANGELOG.md")) -replace '\[NOMBRE DEL PROYECTO\]', $ProjectName | Set-Content (Join-Path $NewProjectPath "CHANGELOG.md")
Set-Location $NewProjectPath
git init -q
git lfs install --local 2>$null
git add .
git commit -q -m "chore: scaffold project from NYQUEN LABS KiCad template"
git branch -M main
Write-Host "Done. Project created at: $NewProjectPath"
