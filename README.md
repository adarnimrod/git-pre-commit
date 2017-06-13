# Git pre-commit hooks

[![Build
Status](https://travis-ci.org/adarnimrod/git-pre-commit.svg?branch=master)](https://travis-ci.org/adarnimrod/git-pre-commit)

[Pre-commit](http://pre-commit.com/) Git related hooks.

- `merge-conflict`: Checks if your branch has merge conflicts with the master
  branch.

## Installation

Add the following to your project's `.pre-commit-config.yaml`:

    -    repo: https://www.shore.co.il/git/git-pre-commit
         sha: v0.1.0
         hooks:
         - id: merge-conflict
           always_run: True

## License

This software is licensed under the MIT license (see the `LICENSE.txt` file).

## Author information

Nimrod Adar, [contact me](mailto:nimrod@shore.co.il) or visit my
[website](https://www.shore.co.il/). Patches are welcome via [git
send-email](http://git-scm.com/book/en/v2/Git-Commands-Email). The repository is
located at <https://www.shore.co.il/git/>.
