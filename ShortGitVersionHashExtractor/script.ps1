$gitPath = Get-VstsInput -Name gitPath -Require

Write-Output "Search for git commit hash in $gitPath"

if(![System.IO.File]::Exists($gitPath)){
    Write-Output "Path does not exists: $gitPath"
    exit 1
}

cd $gitPath
$ShortVersionHash = git rev-parse --short HEAD

Write-Output "Found commit hash: $ShortVersionHash"
Write-Output "##vso[task.setvariable variable=ShortVersionHash;]$ShortVersionHash"
Write-Output "Set environment variable to ($env:ShortVersionHash)"

exit 0