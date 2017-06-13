#!/usr/bin/env bats

export PATH="$BATS_TEST_DIRNAME/../:$PATH"
export repo="$BATS_TMPDIR/testrepo"

@test "setup" {
    if [ ! -f "$repo/file" ]
    then
        git init "$repo"
        cd "$repo"
        echo 1 > file
        git add file
        git commit -m "Initial commit."
        git checkout -b master2
        git checkout -b no-conflict
        git checkout -b conflict
        echo 2 > file
        git commit file -m "Conflict with master."
        git checkout master
        echo 3 > file
        git commit file -m "Conflict with the conflict branch."
    fi
}

@test "Same branch" {
    cd "$repo"
    git checkout master || true
    merge-conflict
}

@test "No conflict" {
    cd "$repo"
    git checkout no-conflict || true
    merge-conflict
}

@test "Different than master" {
    cd "$repo"
    git checkout master || true
    merge-conflict master2
}

@test "Conflict" {
    cd "$repo"
    git checkout conflict || true
    ! merge-conflict
}

@test "teardown" {
    rm -rf "$repo"
}
