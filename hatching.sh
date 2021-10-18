#!/bin/bash

. config.sh
. utils.sh

CWD=${PWD}
PJD="$(dirname "$CWD")/${PROJECT}"

CREATE=""
confirm "You are about to create a new project named $PROJECT.\nIf such a project already exists it will be deteted!" "Yes" CREATE

if [[ "$CREATE" == "Yes" ]]; then  
    echo -e "\nStarting project creation...\n"
    rm -rf "../$PROJECT"
    bash setup_project.sh
    cd "$PJD" || exit 1
    CREATE=""
    confirm "You are about to push your first commit to git@$REPO.git\nYou might have to create this repository first if it does not exist yet. Files already on the repository will be overwritten." "No" CREATE
    if [[ "$CREATE" == "Yes" ]]; then 
        echo -e "\nset origin and push to remote\n"
        git remote add origin "git@$REPO.git"
        git push -u -f origin master
        git checkout -b develop
	git push --set-upstream origin --force develop
    else
	echo -e "\nRemote was not set.\n"
    fi
    echo -e "\nIf everything went well, you may create a requirements.txt file and test building the docs with bash quickstart.sh\n"

    echo -e "\nTo create the documentation in reathedocs.org:\n"
    echo -e "1. Sign-in the readthedocs.org and import the project from its repo\n(you may configure a webhook to your remote repository or use manual build).\n"
    echo -e "2. Build within readthedocs.org and check that it is passing\n"
    echo -e "Rem: You may configure the documentation build by altering the .readthedocs.yaml file" 
   
    echo -e "\nSwitched to develop branch...\nCurrent status:\n"
    git status

    # Enter project
    ##########################################################################################
    if [ $ENTERPROJECT = 1 ]; then
        echo -e "Entering $PROJECT...\n"
        if [ $ACTIVATEPIPENV = 1 ]; then
            python3 -m pipenv shell
        fi
    fi 
else
    echo -e "\nProject creation aborted !\n"
fi


#cat "../$PROJECT/README.md"
