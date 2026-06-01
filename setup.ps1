# AI Project Starter: Setup Script
# Usage: .\setup.ps1 "C:\Path\To\New\Project"

$targetDir = $args[0]

if (-not $targetDir) {
    Write-Host "Error: Please provide a target directory path." -ForegroundColor Red
    Write-Host "Usage: .\setup.ps1 `"C:\Path\To\New\Project`""
    exit 1
}

# Resolve to absolute path
$targetDir = Resolve-Path $targetDir -ErrorAction SilentlyContinue
if (-not $targetDir) {
    # If path doesn't exist, use the raw string (it will be created)
    $targetDir = $args[0]
}

Write-Host "--- Initializing AI Project Starter in: $targetDir ---" -ForegroundColor Cyan

# Create target directory if it doesn't exist
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    Write-Host "Created directory: $targetDir" -ForegroundColor Gray
}

# Define items to copy
$itemsToCopy = @(".ai", "AGENTS.md", "PROJECT_STATUS.md", "README.md", ".gitignore")

foreach ($item in $itemsToCopy) {
    $sourcePath = Join-Path $PSScriptRoot $item
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $targetDir -Recurse -Force
        Write-Host "Copied: $item" -ForegroundColor Gray
    } else {
        Write-Host "Warning: $item not found in starter folder." -ForegroundColor Yellow
    }
}

Write-Host "--- Setup Complete! ---" -ForegroundColor Green
Write-Host "Next Steps:"
Write-Host "1. Go to your new project: cd `"$targetDir`""
Write-Host "2. Initialize git: git init"
Write-Host "3. Customize PROJECT_STATUS.md and AGENTS.md"
