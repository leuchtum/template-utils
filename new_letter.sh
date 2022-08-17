# Stop if error
set -e

# Check that NAME is set
if [ -z "$NAME" ]
then
echo "NAME not set."
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

# Set names
DATE_STR=$(date "+%Y%m%d")
PROJECT_PATH="${DATE_STR}_${NAME_CLEAN}"

# Clone repo
git clone git@github.com:leuchtum/template-letter.git $PROJECT_PATH

# Change directory
cd $PROJECT_PATH

# Remove .gitignore
rm -rf .git .gitignore

# Rename tamplate
mv letter.tex "${NAME_CLEAN}.tex"

# New .gitignore
echo "# USER\n.DS_Store\n" > .gitignore
curl -s https://raw.githubusercontent.com/github/gitignore/main/TeX.gitignore >> .gitignore

# First commit
git init --initial-branch=main
git add .
git commit -m "Initial commit"


