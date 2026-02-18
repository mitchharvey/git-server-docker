# git-server-docker
### *Forked from https://github.com/jkarlosb/git-server-docker*
Docker Hub: https://hub.docker.com/r/mitchharvey/git-server

This fork will create repo on push if it doesn't already exist, instead of needing to manually copy the .git folder to the server:
```sh
git init
touch me
git add me
git commit -m "init"
git remote add origin SERVER:repo
git push -u origin master
# done you can now run
git clone SERVER:repo
```

How to use as a secondary push remote:
```sh
$ git remote -v
# origin  git@github.com:mitchharvey/repo.git (fetch)
# origin  git@github.com:mitchharvey/repo.git (push)
$ git remote set-url --add --push origin SERVER:repo
$ git remote -v
# origin  git@github.com:mitchharvey/repo.git (fetch)
# origin  SERVER:repo (push)
$ git remote set-url --add --push origin git@github.com:mitchharvey/repo.git
$ git remote -v
# origin  git@github.com:mitchharvey/repo.git (fetch)
# origin  SERVER:repo (push)
# origin  git@github.com:mitchharvey/repo.git (push)
$ git push -v --all
# Pushing to SERVER:repo
# To SERVER:repo
# = [up to date]      master -> master
# updating local tracking ref 'refs/remotes/origin/master'
# Everything up-to-date
# Pushing to github.com:mitchharvey/repo.git
# To github.com:mitchharvey/repo.git
# = [up to date]      master -> master
# updating local tracking ref 'refs/remotes/origin/master'
# Everything up-to-date
```

Full list of changes: https://github.com/mitchharvey/git-server-docker/compare/cbbb44b..master
