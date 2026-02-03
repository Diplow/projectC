# loop.ps1 — Runs the cognitive loop until LEARN or blocked

$ErrorActionPreference = "Stop"
$projectDir = $PSScriptRoot
Set-Location $projectDir

$stateFile = Join-Path $projectDir "current.json"
$steps = @("explore", "experiment", "memorize", "theorize", "learn")

function Read-State {
    return Get-Content $stateFile -Raw | ConvertFrom-Json
}

function Write-State {
    param($state)
    $state | ConvertTo-Json | Set-Content $stateFile
}

function Get-NextStep {
    param($currentStep)
    $idx = $steps.IndexOf($currentStep)
    if ($idx -ge ($steps.Count - 1)) {
        return $null  # cycle complete
    }
    return $steps[$idx + 1]
}

function Get-StepPrompt {
    param($step, $cycle)
    $templatePath = Join-Path $projectDir "prompts\$step.md"
    if (-not (Test-Path $templatePath)) {
        throw "No prompt template found for step: $step"
    }
    $template = Get-Content $templatePath -Raw
    return $template -replace '\{\{CYCLE\}\}', $cycle
}

# --- Main loop ---

Write-Host "=== C Loop Runner ===" -ForegroundColor Cyan
Write-Host ""

while ($true) {
    $state = Read-State

    # Check blocked
    if ($state.status -eq "blocked") {
        Write-Host "[BLOCKED] $($state.blocked_reason)" -ForegroundColor Red
        break
    }

    # Check if LEARN step — needs user
    if ($state.step -eq "learn") {
        Write-Host "[LEARN] Cycle $($state.cycle) reached LEARN step." -ForegroundColor Yellow
        Write-Host "  Review: Experiences/cycle-$($state.cycle)-summary.md" -ForegroundColor Yellow
        Write-Host "  Run a LEARN session with the user before advancing." -ForegroundColor Yellow
        break
    }

    $step = $state.step
    $cycle = $state.cycle

    Write-Host "[CYCLE $cycle] Running step: $($step.ToUpper())..." -ForegroundColor Green

    # Update state to running
    $state.status = "running"
    Write-State $state

    # Get the prompt for this step
    try {
        $prompt = Get-StepPrompt -step $step -cycle $cycle
    }
    catch {
        $state.status = "blocked"
        $state.blocked_reason = "Failed to load prompt for step: $step — $_"
        Write-State $state
        Write-Host "[BLOCKED] $($state.blocked_reason)" -ForegroundColor Red
        break
    }

    # Run claude with the step prompt
    $prompt | claude -p --verbose 2>&1 | Tee-Object -Variable claudeOutput

    $exitCode = $LASTEXITCODE

    if ($exitCode -ne 0) {
        $state.status = "blocked"
        $state.blocked_reason = "Step $step exited with code $exitCode"
        Write-State $state
        Write-Host "[BLOCKED] $($state.blocked_reason)" -ForegroundColor Red
        break
    }

    Write-Host "[CYCLE $cycle] Step $($step.ToUpper()) completed." -ForegroundColor Green

    # Advance to next step
    $nextStep = Get-NextStep -currentStep $step

    if ($null -eq $nextStep) {
        # Full cycle done (shouldn't happen since learn comes before wrap)
        $state.cycle = $state.cycle + 1
        $state.step = "explore"
    }
    else {
        $state.step = $nextStep
    }

    $state.status = "pending"
    $state.blocked_reason = $null
    Write-State $state

    Write-Host ""
}

Write-Host ""
Write-Host "=== Loop stopped ===" -ForegroundColor Cyan
