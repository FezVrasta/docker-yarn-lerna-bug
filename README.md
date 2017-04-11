Make sure to have Docker installed, then:

```
cd /tmp
git clone git@github.com:FezVrasta/docker-yarn-lerna-bug.git
cd docker-yarn-lerna-bug
yarn
yarn start
```

Notice that it fails with:

```
Installing external dependencies
NpmUtilities.installInDir     ("./packages/foo", ["babel-cli@^6.22.2","babel-core@^6.22.1","babel-preset-es2015@^6.22.0","jest-bamb...)
Command exited with status 1: yarn install
Errored while running BootstrapCommand.execute
Command exited with status 1: yarn install
Waiting for 1 child process to exit. CTRL-C to exit immediately.
error Command failed with exit code 1.
The command '/bin/sh -c yarn bootstrap' returned a non-zero code: 1
error Command failed with exit code 1.
```

Inside the container, in the `packages/foo` dir, you'll find a `yarn-error.log`:

```
Error: https://registry.yarnpkg.com/babel-cli/-/babel-cli-6.24.0.tgz: ENOENT: no such file or directory, open '/root/.cache/yarn/v1/npm-babel-cli-6.24.0-a05ffd210dca0c288a26d5319c5ac8669a265ad0/.yarn-tarball.tgz'
```

If you remove the `@scope` from `packages/foo/package.json` everything works fine.

If you edit `package.json` changing `bootstrap` to `lerna bootstrap --concurrency=1` it works fine.


If you run:

```
$(yarn bin)/lerna bootstrap
```

from the repository root directory, everything works fine (at least, on macOS).
