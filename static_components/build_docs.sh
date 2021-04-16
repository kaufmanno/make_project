CWD=$(pwd)  # project directory
DCD="$CWD/docs"
ULD="$CWD/uml_diagrams"
cd "$ULD"
python3 update_uml_in_docs.py
cd "$DCD"
make html
cd "$CWD"
firefox "file://$DCD/build/html/index.html"

