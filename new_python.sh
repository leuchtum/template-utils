# Stop if error
set -e

# Check that NAME is set
if [ -z "$NAME" ]
then
echo "NAME not set."
exit 1
fi

# Check that PYTHON is set
if [ -z "$PYTHON" ]
then
echo "PYTHON not set."
exit 1
fi

# Check that no other arg is set
if [ -n "$1" ]
then
echo "Too many arguments set."
exit 1
fi

# ' '->'_' and all lower
NAME_CLEAN=$(echo ${NAME} | sed -e 's/ /_/g' | tr '[:upper:]' '[:lower:]')

# Define params
NAME_CONDA_ENV="${NAME_CLEAN}_env"
NAME_PROJECT=$NAME_CLEAN
NAME_MODULE=$NAME_CLEAN
PYTHON_VERSION=$PYTHON

# Clone 
git clone git@github.com:leuchtum/template-python.git $NAME_PROJECT

# Change directory
cd $NAME_PROJECT

# Remove .git directory
rm -rf .git/

# Remove '#' column from .gitignore
cut -c2- .gitignore > cache_gitignore
mv cache_gitignore .gitignore

# Copy tamplate to destination directory
mv src/package src/$NAME_MODULE

# Change permissions of checkfile
chmod 777 dev_checks.sh

# Parse environment.yml and create conda env
eval "echo \"$(< environment.yml)\"" > environment.yml
conda env create --file environment.yml

# First commit
git init --initial-branch=main
git add .
git commit -m "Initial commit"

# User info
echo "\n\nTo activate env run:\n\n\tconda activate $NAME_CONDA_ENV\n\n"