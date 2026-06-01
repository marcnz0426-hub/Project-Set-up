# AI Project Starter: Sync Script
# Usage: .\upload.ps1 "Your commit message"

$msg = $args[0]
if (-not $msg) {
    $msg = "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}

Write-Host "--- Syncing AI Project Starter ---" -ForegroundColor Cyan

# Check for remote
$remote = git remote
if (-not $remote) {
    Write-Host "Error: No git remote configured." -ForegroundColor Red
    Write-Host "Please run: git remote add origin <your-repo-url>"
    exit 1
}

git add .
git commit -m $msg
git push origin master

Write-Host "--- Upload Complete ---" -ForegroundColor Green
