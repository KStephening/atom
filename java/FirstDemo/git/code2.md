```git
Administrator@DNC-01712111555 MINGW64 /
$ cd learngit
bash: cd: learngit: No such file or directory

Administrator@DNC-01712111555 MINGW64 /
$ pwd
/

Administrator@DNC-01712111555 MINGW64 /
$ git
usage: git [--version] [--help] [-C <path>] [-c name=value]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone      Clone a repository into a new directory
   init       Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add        Add file contents to the index
   mv         Move or rename a file, a directory, or a symlink
   reset      Reset current HEAD to the specified state
   rm         Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect     Use binary search to find the commit that introduced a bug
   grep       Print lines matching a pattern
   log        Show commit logs
   show       Show various types of objects
   status     Show the working tree status

grow, mark and tweak your common history
   branch     List, create, or delete branches
   checkout   Switch branches or restore working tree files
   commit     Record changes to the repository
   diff       Show changes between commits, commit and working tree, etc
   merge      Join two or more development histories together
   rebase     Reapply commits on top of another base tip
   tag        Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch      Download objects and refs from another repository
   pull       Fetch from and integrate with another repository or a local branch
   push       Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.

Administrator@DNC-01712111555 MINGW64 /
$ git add readme.txt
fatal: Not a git repository (or any of the parent directories): .git

Administrator@DNC-01712111555 MINGW64 /
$ cd C:\Users\Administrator\learngit
bash: cd: C:UsersAdministratorlearngit: No such file or directory

Administrator@DNC-01712111555 MINGW64 /
$ cd c:\
> cd user
bash: cd: too many arguments

Administrator@DNC-01712111555 MINGW64 /
$ cd C:\Users\Administrator\learngi
bash: cd: C:UsersAdministratorlearngi: No such file or directory

Administrator@DNC-01712111555 MINGW64 /
$ cd learngit
bash: cd: learngit: No such file or directory

Administrator@DNC-01712111555 MINGW64 /
$ git config --lis
core.symlinks=false
core.autocrlf=true
core.fscache=true
color.diff=auto
color.status=auto
color.branch=auto
color.interactive=true
help.format=html
rebase.autosquash=true
http.sslcainfo=D:/git/Git/mingw64/ssl/certs/ca-bundle.crt
http.sslbackend=openssl
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
credential.helper=manager
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
user.name=qqqqer@outlook.com
user.email=35948052+keeeeeer@users.noreply.github.com

Administrator@DNC-01712111555 MINGW64 /
$ cd C:\Users\Administrator\
>
bash: cd: C:UsersAdministrator: No such file or directory

Administrator@DNC-01712111555 MINGW64 /
$ cd C:/Users/Administrator/learngit

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "wrote a readme file"
[master (root-commit) c33e0d1] wrote a readme file
 1 file changed, 2 insertions(+)
 create mode 100644 readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git diff
diff --git a/readme.txt b/readme.txt
index 07737d4..4deb53c 100644
--- a/readme.txt
+++ b/readme.txt
@@ -1,2 +1,2 @@
-Git is a version control system.
+Git is a distributed version control system.
 Git is free softwre.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   readme.txt


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "add distributed"
[master 4952f6f] add distributed
 1 file changed, 1 insertion(+), 1 deletion(-)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git diff
diff --git a/readme.txt b/readme.txt
index 4deb53c..12cd25e 100644
--- a/readme.txt
+++ b/readme.txt
@@ -1,2 +1,2 @@
 Git is a distributed version control system.
-Git is free softwre.
+Git is free softwre distributed under the GPL.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add "readme.txt"

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   readme.txt



Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "add distributed under the GPL"
[master 7ed8463] add distributed under the GPL
 1 file changed, 1 insertion(+), 1 deletion(-)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git log
commit 7ed8463f0a517f233c58fe6ceef04f76b85c2b7d (HEAD -> master)
Author: qqqqer@outlook.com <35948052+keeeeeer@users.noreply.github.com>
Date:   Thu Feb 1 09:12:38 2018 +0800

    add distributed under the GPL

commit 4952f6fab86d83b7d05a18191800aedd4c877aeb
Author: qqqqer@outlook.com <35948052+keeeeeer@users.noreply.github.com>
Date:   Thu Feb 1 08:56:36 2018 +0800

    add distributed

commit c33e0d1081e221c6f12bd0bd81a80444164aa276
Author: qqqqer@outlook.com <35948052+keeeeeer@users.noreply.github.com>
Date:   Thu Feb 1 08:23:02 2018 +0800

    wrote a readme file

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git log --pretty=online
fatal: invalid --pretty format: online

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git log --pretty=oneline
7ed8463f0a517f233c58fe6ceef04f76b85c2b7d (HEAD -> master) add distributed under                  the GPL
4952f6fab86d83b7d05a18191800aedd4c877aeb add distributed
c33e0d1081e221c6f12bd0bd81a80444164aa276 wrote a readme file

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git rest --hard^
git: 'rest' is not a git command. See 'git --help'.

The most similar command is
        reset

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reset --hard^
error: unknown option `hard^'
usage: git reset [--mixed | --soft | --hard | --merge | --keep] [-q] [<commit>]
   or: git reset [-q] [<tree-ish>] [--] <paths>...
   or: EXPERIMENTAL: git reset [-q] [--stdin [-z]] [<tree-ish>]
   or: git reset --patch [<tree-ish>] [--] [<paths>...]

    -q, --quiet           be quiet, only report errors
    --mixed               reset HEAD and index
    --soft                reset only HEAD
    --hard                reset HEAD, index and working tree
    --merge               reset HEAD, index and working tree
    --keep                reset HEAD but keep local changes
    --recurse-submodules[=<reset>]
                          control recursive updating of submodules
    -p, --patch           select hunks interactively
    -N, --intent-to-add   record only the fact that removed paths will be added                  later
    -z                    EXPERIMENTAL: paths are separated with NUL character
    --stdin               EXPERIMENTAL: read paths from <stdin>


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reset --head^
error: unknown option `head^'
usage: git reset [--mixed | --soft | --hard | --merge | --keep] [-q] [<commit>]
   or: git reset [-q] [<tree-ish>] [--] <paths>...
   or: EXPERIMENTAL: git reset [-q] [--stdin [-z]] [<tree-ish>]
   or: git reset --patch [<tree-ish>] [--] [<paths>...]

    -q, --quiet           be quiet, only report errors
    --mixed               reset HEAD and index
    --soft                reset only HEAD
    --hard                reset HEAD, index and working tree
    --merge               reset HEAD, index and working tree
    --keep                reset HEAD but keep local changes
    --recurse-submodules[=<reset>]
                          control recursive updating of submodules
    -p, --patch           select hunks interactively
    -N, --intent-to-add   record only the fact that removed paths will be added                  later
    -z                    EXPERIMENTAL: paths are separated with NUL character
    --stdin               EXPERIMENTAL: read paths from <stdin>


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reset --hard HEAD^
HEAD is now at 4952f6f add distributed

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git log
commit 4952f6fab86d83b7d05a18191800aedd4c877aeb (HEAD -> master)
Author: qqqqer@outlook.com <35948052+keeeeeer@users.noreply.github.com>
Date:   Thu Feb 1 08:56:36 2018 +0800

    add distributed

commit c33e0d1081e221c6f12bd0bd81a80444164aa276
Author: qqqqer@outlook.com <35948052+keeeeeer@users.noreply.github.com>
Date:   Thu Feb 1 08:23:02 2018 +0800

    wrote a readme file

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reset --hard 7ed8463f
HEAD is now at 7ed8463 add distributed under the GPL

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reflog
7ed8463 (HEAD -> master) HEAD@{0}: reset: moving to 7ed8463f
4952f6f HEAD@{1}: reset: moving to HEAD^
7ed8463 (HEAD -> master) HEAD@{2}: commit: add distributed under the GPL
4952f6f HEAD@{3}: commit: add distributed
c33e0d1 HEAD@{4}: commit (initial): wrote a readme file

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ la -sh
bash: la: command not found

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ ls -ah
./  ../  .git/  readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ GIT STATUS
fatal: cannot handle STATUS.exe as a builtin

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        LICENSE

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add 'readme.txt'

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add 'LICENSE'

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   LICENSE
        modified:   readme.txt


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "understand how stage works"
[master c0a6e48] understand how stage works
 2 files changed, 2 insertions(+)
 create mode 100644 LICENSE

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.
Git track changes.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   readme.txt


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.
Git track changes.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.
Git track changes of file.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "git tracks changes"
[master 4879099] git tracks changes
 1 file changed, 1 insertion(+)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git diff HEAD --readme.txt
usage: git diff [<options>] [<commit> [<commit>]] [--] [<path>...]

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git diff HEAD -- readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commiit -m "hah"
git: 'commiit' is not a git command. See 'git --help'.

The most similar command is
        commit

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "hah"
[master 8ad3d96] hah
 1 file changed, 1 insertion(+)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "hahsd"
On branch master
Changes not staged for commit:
        modified:   readme.txt

no changes added to commit

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git diff HEAD -- readme.txt
diff --git a/readme.txt b/readme.txt
index 396463b..e6cf475 100644
--- a/readme.txt
+++ b/readme.txt
@@ -3,3 +3,4 @@ Git is free softwre distributed under the GPL.
 Git has a mutale index called stage.
 Git track changes of file.
 a
+sd

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add 'readme.txt'

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "add sd"
[master 1c802fa] add sd
 1 file changed, 1 insertion(+)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.
Git track changes of file.
a

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git checkout --readme.txt
error: unknown option `readme.txt'
usage: git checkout [<options>] <branch>
   or: git checkout [<options>] [<branch>] -- <file>...

    -q, --quiet           suppress progress reporting
    -b <branch>           create and checkout a new branch
    -B <branch>           create/reset and checkout a branch
    -l                    create reflog for new branch
    --detach              detach HEAD at named commit
    -t, --track           set upstream info for new branch
    --orphan <new-branch>
                          new unparented branch
    -2, --ours            checkout our version for unmerged files
    -3, --theirs          checkout their version for unmerged files
    -f, --force           force checkout (throw away local modifications)
    -m, --merge           perform a 3-way merge with the new branch
    --overwrite-ignore    update ignored files (default)
    --conflict <style>    conflict style (merge or diff3)
    -p, --patch           select hunks interactively
    --ignore-skip-worktree-bits
                          do not limit pathspecs to sparse entries only
    --ignore-other-worktrees
                          do not check if another worktree is holding the given ref
    --recurse-submodules[=<checkout>]
                          control recursive updating of submodules
    --progress            force progress reporting


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git checkout -- readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.
Git track changes of file.
a
sd

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "add HELLO"
[master b432e87] add HELLO
 1 file changed, 1 insertion(+)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git checkout -- readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.
Git track changes of file.
a
sd
HELLO

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git checkout -- readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cat readme.txt
Git is a distributed version control system.
Git is free softwre distributed under the GPL.
Git has a mutale index called stage.
Git track changes of file.
a
sd
HELLO

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   readme.txt


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reset HEAD readme.txt
Unstaged changes after reset:
M       readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$  git checkout -- readme.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reset hard HEAD^ -- readme.txt
fatal: ambiguous argument 'hard': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git reset -- hard HEAD^

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add 'readme.txt'

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "back"
[master f94384b] back
 1 file changed, 3 deletions(-)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add test.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "add test.txt"
[master e7f74ea] add test.txt
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 test.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ rm test.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    test.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git rm test.txt
rm 'test.txt'

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git checkout -- test.txt
error: pathspec 'test.txt' did not match any file(s) known to git.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add test.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -"new"
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ rm test.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git checkout -- test.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ ssh-keygen -t rsa -C "qqqqer@outlook.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/Administrator/.ssh/id_rsa):
Created directory '/c/Users/Administrator/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/Administrator/.ssh/id_rsa.
Your public key has been saved in /c/Users/Administrator/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:TFbThEV0TgJ4udJ9RCZfu6sOEqYa3tGi8kZzhNwOTDY qqqqer@outlook.com
The key's randomart image is:
+---[RSA 2048]----+
|         .+XB.= .|
|     E  ..+..O...|
|    = + oo o .o. |
|     = *. o . . .|
|      + S+   . . |
|     o o+ .     .|
|    ..o+ o .   . |
|   ...= o . . .  |
|    += .    .o   |
+----[SHA256]-----+

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git remote add origin git @github.com:KStephening/learngit.git
usage: git remote add [<options>] <name> <url>

    -f, --fetch           fetch the remote branches
    --tags                import all tags and associated objects when fetching
                          or do not fetch any tag at all (--no-tags)
    -t, --track <branch>  branch(es) to track
    -m, --master <branch>
                          master branch
    --mirror[=<push|fetch>]
                          set up remote as a mirror to push to or fetch from


Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git remote add origin git@github.com:KStephening/learngit.git

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git push -u origin master
The authenticity of host 'github.com (192.30.255.113)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git push -u origin master
The authenticity of host 'github.com (192.30.255.113)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,192.30.255.113' (RSA) to the list of known hosts.
To github.com:KStephening/learngit.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:KStephening/learngit.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git remote -v
origin  git@github.com:KStephening/learngit.git (fetch)
origin  git@github.com:KStephening/learngit.git (push)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git push -u origin master
To github.com:KStephening/learngit.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:KStephening/learngit.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ ^C

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git remote add origin git@github.com:KStephening/learngit.git
fatal: remote origin already exists.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ ls -al ~/.ssh
total 14
drwxr-xr-x 1 Administrator 197121    0 二月  1 19:54 ./
drwxr-xr-x 1 Administrator 197121    0 二月  1 19:40 ../
-rw-r--r-- 1 Administrator 197121 1675 二月  1 19:41 id_rsa
-rw-r--r-- 1 Administrator 197121  400 二月  1 19:41 id_rsa.pub
-rw-r--r-- 1 Administrator 197121  407 二月  1 19:54 known_hosts

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$  git remote add origin https://github.com/KStephening/learngit.git
fatal: remote origin already exists.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ pull --rebase origin master
bash: pull: command not found

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git pull --rebase origin master
error: cannot pull with rebase: You have unstaged changes.
error: please commit or stash them.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git
usage: git [--version] [--help] [-C <path>] [-c name=value]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone      Clone a repository into a new directory
   init       Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add        Add file contents to the index
   mv         Move or rename a file, a directory, or a symlink
   reset      Reset current HEAD to the specified state
   rm         Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect     Use binary search to find the commit that introduced a bug
   grep       Print lines matching a pattern
   log        Show commit logs
   show       Show various types of objects
   status     Show the working tree status

grow, mark and tweak your common history
   branch     List, create, or delete branches
   checkout   Switch branches or restore working tree files
   commit     Record changes to the repository
   diff       Show changes between commits, commit and working tree, etc
   merge      Join two or more development histories together
   rebase     Reapply commits on top of another base tip
   tag        Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch      Download objects and refs from another repository
   pull       Fetch from and integrate with another repository or a local branch
   push       Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   test.txt

no changes added to commit (use "git add" and/or "git commit -a")

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ add
bash: add: command not found

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git add test.txt

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git commit -m "ha"
[master 17df001] ha
 1 file changed, 7 insertions(+)

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git pull --rebase origin master
warning: no common commits
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From github.com:KStephening/learngit
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master
First, rewinding head to replay your work on top of it...
Applying: wrote a readme file
Applying: add distributed
Applying: add distributed under the GPL
Applying: understand how stage works
Applying: git tracks changes
Applying: hah
Applying: add sd
Applying: add HELLO
Applying: back
Applying: add test.txt
Applying: ha

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git push -u origin master
Counting objects: 32, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (30/30), done.
Writing objects: 100% (32/32), 3.02 KiB | 514.00 KiB/s, done.
Total 32 (delta 13), reused 0 (delta 0)
remote: Resolving deltas: 100% (13/13), done.
To github.com:KStephening/learngit.git
   49f741f..9061acb  master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ git clone git@github.com:KStephening/longer.git
Cloning into 'longer'...
Warning: Permanently added the RSA host key for IP address '192.30.255.112' to the list of known hosts.
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.

Administrator@DNC-01712111555 MINGW64 ~/learngit (master)
$ cd longer

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (master)
$ ls
README.md

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (master)
$ pwd
/c/Users/Administrator/learngit/longer

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (master)
$ git checkout -b dev
Switched to a new branch 'dev'

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (dev)
$ git branch
* dev
  master

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (dev)
$ git add readme.txt
fatal: pathspec 'readme.txt' did not match any files

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (dev)
$ git commit -m "branch"
On branch dev
nothing to commit, working tree clean

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (dev)
$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (master)
$ cat readme.txt
cat: readme.txt: No such file or directory

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (master)
$ ls
README.md

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (master)
$ pwd
/c/Users/Administrator/learngit/longer

Administrator@DNC-01712111555 MINGW64 ~/learngit/longer (master)
```
