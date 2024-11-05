if ($Env:PLUGIN_DEPTH) {
    $flags = "--depth=$Env:PLUGIN_DEPTH"
}
else {
    $flags = ""
}

if (!(Test-Path .git)) {
	Write-Host 'git init';
	git init
	Write-Host "git remote add origin $Env:DRONE_REMOTE_URL"
	git remote add origin $Env:DRONE_REMOTE_URL
}

if ($flags) {
    Write-Host "git fetch $flags origin +refs/heads/${Env:DRONE_COMMIT_BRANCH}:";
    git fetch $flags origin "+refs/heads/${Env:DRONE_COMMIT_BRANCH}:";
}
else {
    Write-Host "git fetch origin +refs/heads/${Env:DRONE_COMMIT_BRANCH}:";
    git fetch origin "+refs/heads/${Env:DRONE_COMMIT_BRANCH}:";
}

Write-Host "git checkout $Env:DRONE_COMMIT_SHA -b $Env:DRONE_COMMIT_BRANCH";
git checkout $Env:DRONE_COMMIT_SHA -b $Env:DRONE_COMMIT_BRANCH;
