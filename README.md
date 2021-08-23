# copy-hooks

Easily copy hooks to the git hooks. Works with bare repositories as well.

## How it works?

```

| .git/
|   branches/
|   config
|   description
|   HEAD
|   hooks/ <-- to here
|     applypatch-msg.sample
|     pre-applypatch.sample
|     pre-commit.sample
|     (...)
|   index
|   (...)
| hooks/ <-- copy everything from here
|   pre-commit
|   post-commit
|   (...)
| src/
| (...)

```

# Author

Created by [Breno Salles](https://brenosalles.com).

# License

This repository is licensed under [MIT License](./LICENSE).
