param(
    [Parameter(Mandatory=$true)][string]$RevLabel,
    [Parameter(Mandatory=$true)][string]$Message
)
$ErrorActionPreference = "Stop"
if ($RevLabel -notmatch '^rev[A-Z](\.[0-9]+)?$') {
    Write-Warning "'$RevLabel' doesn't match the expected pattern (revA, revB, revA.1, ...)."
    $confirm = Read-Host "Continue anyway? [y/N]"
    if ($confirm -notmatch '^[Yy]$') { exit 1 }
}
git rev-parse $RevLabel 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Error "Tag '$RevLabel' already exists. Use $RevLabel.1 for a re-send instead."
    exit 1
}
$status = git diff-index --quiet HEAD --
if ($LASTEXITCODE -ne 0) {
    Write-Warning "You have uncommitted changes. The tag will point to the last commit."
    $confirm = Read-Host "Continue anyway? [y/N]"
    if ($confirm -notmatch '^[Yy]$') { exit 1 }
}
git tag -a $RevLabel -m $Message
Write-Host "Tagged current commit as '$RevLabel'."
Write-Host "Push tags from GitHub Desktop, or: git push origin main --tags"
