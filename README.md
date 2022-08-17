# New python project
```sh
curl -s https://raw.githubusercontent.com/leuchtum/template-utils/main/new_python.sh | NAME=name PYTHON=3.10 sh
 ```

If repo should also be on GitHub:
1. Open new **completely empty** repo on GitHub
2. Run following:
    ```sh
    git remote add origin git@github.com:leuchtum/<name_repo>.git
    git branch -M main
    git push -u origin main
    ```

# New letter
```sh
curl -s https://raw.githubusercontent.com/leuchtum/template-utils/main/new_letter.sh | NAME=name sh
 ```
