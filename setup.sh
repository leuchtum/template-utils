git clone https://github.com/leuchtum/template.git $1

cd $1

rm -rf .git/

cut -c2- .gitignore > cache_gitignore
mv cache_gitignore .gitignore

mv template_module $3

chmod 777 dev_checks.sh

conda create -y -n $2
conda install -y -n $2 python
conda install -y -n $2 --file requirements.dev
conda install -y -n $2 --file requirements.prod

git init --initial-branch=main
git add .
git commit -m "Initial commit"

echo "\n\nTo activate env run:\n\n\tconda activate $2\n\n"