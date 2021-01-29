export PATH="$BATS_TEST_DIRNAME/../:$PATH"
export repo="$BATS_TMPDIR/testrepo"

setup () {
    if [ ! -f "$repo/file" ]
    then
        git init "$repo"
        cd "$repo"
        git config user.name "Your Name"
        git config user.email "name@example.com"
        echo 1 > file
        git add file
        git commit -m "Initial commit."
        git checkout -b master2
        git checkout -b no-conflict
        echo 1 > file2
        git add file2
        git commit -m "Another not-conflicting commit."
        git checkout -b conflict
        echo 2 > file
        git commit file -m "Conflict with master."
        git checkout master
        echo 3 > file
        git commit file -m "Conflict with the conflict branch."
    fi
}

@test "Detached head" {
    cd "$repo"
    git checkout "$(git rev-parse HEAD)"
    merge-conflict
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

@test "Empty patch" {
    cd "$repo"
    git checkout master2 || true
    merge-conflict
}

@test "Conflict" {
    cd "$repo"
    git checkout conflict || true
    ! merge-conflict
}

teardown () {
    rm -rf "$repo"
}
