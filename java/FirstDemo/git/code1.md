# Git code1
## 利用Git bash命令
### 1、cd
```git
cd C:/Android/git-repositories
 ```
>**NOTE:**这里利用&emsp;**/**&emsp;而不是&emsp;**\**&emsp;


### 2、midir创建新目录

```Git
midir new_repository
```
### 3、pwd显示当前目录
```Git
pwd
```
### 4、git init初始化，把这个目录变成Git可以管理的仓库
```Git
git init
```
>当前目录下会多一个`.git`的目录，如果没有，那是已经为这个目录室隐藏的，用`la-sh`命令就可以看到

### 4、把文件添加到仓库需要两步
（1）`git add <file>` 用于向仓库添加文件
```Git
git add read.txt
```
（1）`git commit`用于告诉Git，把文件提交到仓库
```Git
git commit -m "wrote a readme file"
```
>**NOTE:**`git commit`命令后面的`-m`，其后输入的是本次提交的说明。`git commit`命令执行后，会告诉1个文件被改动

### 5.将文件readme.txt修改
利用`git status`查看
```Git
git status
```
>`git status`命令可以告诉我们仓库当前的状态。运行之后，Git会告诉我们read.txt修改了。向要查看上次具体是怎样修改的readme.txt,可以使用`git diff`命令查看

```git
git diff
git add “readme.txt”
git status
git commit -m "add distributed"
git status
```
>**NOTE1:** `git diff`显示怎么修改
>
>**NOTE2:**`git add` “readme.txt”重新提交文件到仓库
>
> **NOTE3:**`git status`查看当时状态，命令执行后，git显示提交一个被修改的文档
>
>**NOTE4:**`git commit -m "add distributed"`提交修改
>
>**NOTE5:** `git status`查看当前状态，git会显示当前没要提交的修改，当前的工作空间是干净的（working directory clean）

```git
git log
git log --pretty-oneline
git reset --hard HEAD^
cat readme.txt
git reset --hard 7ed8463f
git reflog
```
