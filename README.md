# git-server-docker
### *Forked from https://github.com/jkarlosb/git-server-docker*
Docker Hub: https://hub.docker.com/r/mitchharvey/git-server

This fork will create repo on push if it doesn't already exist, instead of needing to manually copy the .git folder to the server:
```sh
git init
git add --all
git commit -m "init"
git remote add origin git@SERVER
git push -U origin master
# done
```

Full list of changes: https://github.com/mitchharvey/git-server-docker/compare/cbbb44b..master
