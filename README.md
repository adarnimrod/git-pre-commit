# Git pre-commit hooks

[![pipeline status](https://git.shore.co.il/nimrod/git-pre-commit/badges/master/pipeline.svg)](https://git.shore.co.il/nimrod/git-pre-commit/-/commits/master)

[Pre-commit](http://pre-commit.com/) Git related hooks.

- `merge-conflict`: Checks if your branch has merge conflicts with the master
  branch.

## Installation

Add the following to your project's `.pre-commit-config.yaml`:

```
-    repo: https://git.shore.co.il/nimrod/git-pre-commit.git
     sha: v0.1.1
     hooks:
     - id: merge-conflict
       args: ['production'] # In case the branch to check against is NOT master.
       always_run: True
```

## License

This software is licensed under the MIT license (see the `LICENSE.txt` file).

## Author information

Nimrod Adar, [contact me](mailto:nimrod@shore.co.il) or visit my
[website](https://www.shore.co.il/). Patches are welcome via
[`git send-email`](http://git-scm.com/book/en/v2/Git-Commands-Email). The repository
is located at: <https://git.shore.co.il/expore/>.
