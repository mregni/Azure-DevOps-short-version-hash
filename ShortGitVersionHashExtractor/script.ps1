$gitPath = Get-VstsInput -Name gitPath -Require

Write-Host "Search for git commit hash in $gitPath"

cd $gitPath
$ShortVersionHash = git rev-parse --short HEAD

Write-Host "Found verion hash: $ShortVersionHash"
Write-Host "##vso[task.setvariable variable=ShortVersionHash]$ShortVersionHash"
Write-Host "Set environment variable to $ShortVersionHash"

exit 0