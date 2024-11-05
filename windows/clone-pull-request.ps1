if ($Env:PLUGIN_DEPTH) {
    $flags = "--depth=$Env:PLUGIN_DEPTH"
}
else {
    $flags = ""
}

if (!(Test-Path .git)) {
	git init
	git remote add origin $Env:DRONE_REMOTE_URL
}

if ($flags) {
    git fetch $flags origin "+refs/heads/${Env:DRONE_COMMIT_BRANCH}:"
}
else {
    git fetch origin "+refs/heads/${Env:DRONE_COMMIT_BRANCH}:"
}

git checkout $Env:DRONE_COMMIT_BRANCH

git fetch origin "${Env:DRONE_COMMIT_REF}:"
git merge $Env:DRONE_COMMIT_SHA
