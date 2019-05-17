$ShortVersionHash = git rev-parse --short HEAD

Write-Host "##vso[task.setvariable variable=ShortVersionHash;]$ShortVersionHash"
Write-Host "Set environment variable to ($env:ShortVersionHash)"