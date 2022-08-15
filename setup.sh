git clone https://github.com/leuchtum/template.git $NAME_PROJECT

cd $NAME_PROJECT

rm -rf .git/

cut -c2- .gitignore > cache_gitignore
mv cache_gitignore .gitignore

mv template_module $NAME_MODULE

chmod 777 dev_checks.sh

conda create -y -n $NAME_CONDA_ENV
conda install -y -n $NAME_CONDA_ENV python
conda install -y -n $NAME_CONDA_ENV --file requirements.dev
conda install -y -n $NAME_CONDA_ENV --file requirements.prod

git init --initial-branch=main
git add .
git commit -m "Initial commit"

echo "\n\nTo activate env run:\n\n\tconda activate $NAME_CONDA_ENV\n\n"