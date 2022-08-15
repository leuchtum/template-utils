rm -r .git
cat .gitignore | cut -c2-100000 > .gitignore
