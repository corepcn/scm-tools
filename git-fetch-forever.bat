:: Use git svn to clone a svn repository where frequent disconnects would fail the clone operation.
:: This repeats the "fetch" operation until it exits with 0
:: Run this inside the git folder after the first failure.
:: Experimenting with performance using -q option

@echo off

:repeat
echo.
@echo fetch restarting %date% %time% 
echo. 
git gc & git svn fetch -q || goto :repeat
git reset --soft refs/remotes/git-svn

echo SVN clone completed.
