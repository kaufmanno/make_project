pipenv lock -r > requirements.txt
pipenv lock -r -d > docs/requirements.txt
git add requirements.txt
git add docs/requirements.txt

