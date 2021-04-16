#!/bin/bash
# Creates a standard environment for starting a python project 
# O. KAUFMANN, 2021
##########################################################################################

# Get version and config
##########################################################################################
. config.sh
. utils.sh

# Get command line parameters
##########################################################################################
((k = 0))
 
# if project name is not supplied in the config.sh file or at the command prompt
# display usage message and die
if ! [ -v PROJECT ]; then 
    if [ $# -eq 0 ]; then
        echo -e "$0 v$VERSION - O. KAUFMANN, 2021.\nPlease specify project name in config file or as an argument when calling $0."
        exit 1
    fi 
    PROJECT=$1
fi

((k = k + 1))
if [ -d "../${PROJECT}" ]; then
  # Control will enter here if $DIRECTORY exists.
  echo -e "$0\nWARNING: ${PROJECT} project already exists !\nexiting now..."
  exit 1
fi

. setup_dirs.sh

# Initialize git 
##########################################################################################
git init
echo -e "\n${k}. Git initialized\n"
((k = k + 1))


# Copy the Pipfile file
##########################################################################################
cp "$DCPD/pipfiles/$PIPFILE" "$PJD/Pipfile"
git add Pipfile
echo -e "\n${k}. Pipfile added\n"
((k = k + 1))


# Activate the virtual environment
##########################################################################################
if [ $ACTIVATEPIPENV = 1 ]; then
    python3 -m pipenv install
    python3 -m pipenv lock -r > requirements.txt
    git add Pipfile.lock requirements.txt
    echo -e "\n${k}. Virtualenv created\n"
    k=$k+1
fi

# Adapt and add files
##########################################################################################
cd "$CWD"
. adapt_files.sh $k
k=$?
cd "$PJD"

# Add last files to git and make an initial commit
##########################################################################################
git add .gitignore .env build_docs.sh core/* uml_diagrams/*

git commit -m 'Initial commit with make_project'

echo -e "\n${k}. Initial commit done!\n"
((k = k + 1))


# Clean-up before exiting
##########################################################################################

if [ $CLEANUP = 1 ]; then
    echo -e "\n${k}. Removing temporary files...\n"
    rm -rf "$TPD"
else
    echo -e "\n${k}. Temporary files left in $TPD\nYou may delete them.\n"
fi

