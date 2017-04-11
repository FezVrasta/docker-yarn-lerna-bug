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

If you remove the `@scope` from `packages/foo/package.json` everything works fine.
