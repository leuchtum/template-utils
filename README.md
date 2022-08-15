1. Clone from template:
    - `git clone https://github.com/leuchtum/template.git $PROJECT`
2. Remove .git folder
    - `cd PROJECT_FOLDER`
    - `rm -r .git`
3. Uncomment gitignore
    - `code .gitignore`
    - Remove `#` from first section

 `NAME_PROJECT=testproject`

 `NAME_CONDA_ENV=testcondaenv`

 `git clone https://github.com/leuchtum/template.git $NAME_PROJECT`

 `curl --silent https://raw.githubusercontent.com/leuchtum/template-utils/main/post_clone_1.sh | bash -s $NAME_PROJECT $NAME_CONDA_ENV`

```sh

NAME_PROJECT=testproject2
NAME_CONDA_ENV=testcondaenv2
NAME_MODULE=module2
git clone https://github.com/leuchtum/template.git $NAME_PROJECT
./template-utils/post_clone_1.sh $NAME_PROJECT $NAME_CONDA_ENV $NAME_MODULE
```

```sh

conda deactivate
rm -rf $NAME_PROJECT
conda env remove -n $NAME_CONDA_ENV
```
