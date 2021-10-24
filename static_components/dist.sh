#!/bin/bash
. utils.sh

# tag
echo -e "Last commit is $(git describe --tags)"
echo -e "Current tag is $(git describe --tags --abbrev=0)" 
read -r -p "What will be the tag of this new version? " NEWTAG
git tag -a $NEWTAG -m "Version $NEWTAG"

# publi
confirm "Publish to Pypi" "No" PUBLISHTOPYPI
if [[ "$PUBLISHTOPYPI" == "Yes" ]]; then  
    echo -e "\nPublishing to PyPI...\n"
    PACKAGEINDEX=""
else
    echo -e "\nPublishing to TestPyPY...\n"
    PACKAGEINDEX="testpypi"
fi

# update the docs ?
confirm "Update the docs" "No" UPDATEDOCS
if [[ "$UPDATEDOCS" == "Yes" ]]; then  
   
    bash build_docs.sh || exit 1
else
    # update requirements.txt only
    echo -e "\nUpdating requirements.txt !\n"
    bash update_requirements.sh || exit 1
fi

# create wheel
python setup.py bdist_wheel || exit 1

# upload wheel to testpypi
twine upload -r "${PACKAGEINDEX}" dist/* || exit 1

