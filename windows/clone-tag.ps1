if ($Env:PLUGIN_DEPTH) {
    $flags = "--depth=$Env:PLUGIN_DEPTH"
}
else {
    $flags = ""
}

if (!(Test-Path -Path .git)) {
    git init
    git remote add origin $Env:DRONE_REMOTE_URL
}

if ($flags) {
    git fetch $flags origin "+refs/tags/${Env:DRONE_TAG}:"
}
else {
    git fetch origin "+refs/tags/${Env:DRONE_TAG}:"
}

git checkout -qf FETCH_HEAD
