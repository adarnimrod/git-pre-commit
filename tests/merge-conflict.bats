#!/usr/bin/env bats

export PATH="$BATS_TEST_DIRNAME/../:$PATH"
export repo="$BATS_TMPDIR/testrepo"

@test "setup" {
    if [ ! -f "$repo/file" ]
    then
        git init "$repo"
        cd "$repo"
        echo 1 > file
        git -C "$repo" add "$repo/file"
        git -C "$repo" commit -m "Initial commit."
        git -C "$repo" checkout -b master2
        git -C "$repo" checkout -b no-conflict
        git -C "$repo" checkout -b conflict
        echo 2 > "$repo/file"
        git -C "$repo" commit file -m "Conflict with master."
        git -C "$repo" checkout master
        echo 3 > "$repo/file"
        git -C "$repo" commit file -m "Conflict with the conflict branch."
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
