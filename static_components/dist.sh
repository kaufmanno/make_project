#!/bin/bash
. utils.sh

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

