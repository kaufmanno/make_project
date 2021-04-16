#!/bin/bash
# Copies and adapts files for a python project 
# Args $1(optional, default: 1): starting processing step number for echo 
#      $2(optional, default: "none"): spec for specific processing step selection
# O. KAUFMANN, 2021
##########################################################################################

# Get utils and config
##########################################################################################
. config.sh
. utils.sh

# Get command line parameter (current step number)
##########################################################################################
if [ $# -gt 0 ]; then
    k=$1
    if [ $# -gt 1 ]; then
        spec="$2"
    else
        spec="none"
    fi
else
    k=1 
fi

# if project name is not supplied in the config.sh file or project directory is not found
# display usage message and die
##########################################################################################
if ! [ -v PROJECT ]; then 
    echo -e "$0 v$VERSION - O. KAUFMANN, 2021.\nPlease specify project name in config file."
    exit 1
fi

if [ ! -d "../${PROJECT}" ]; then
    # Control will enter here if $DIRECTORY does not exist.
    echo -e "$0\nWARNING: ${PROJECT} project not found !\nexiting now..."
    exit 1
fi


CWD=$(pwd)  # setup_project directory
SCPD="$CWD/static_components"
DCPD="$CWD/dynamic_components"
PJD="$(dirname "$CWD")/${PROJECT}"  # Project directory
TPD="$PJD/tmp"
mkdir -p "$TPD"

# Create default static files
##########################################################################################
cp -rT "$SCPD" "$PJD" 

cd "$SCPD"
shopt -s nullglob globstar

Files=(**)

cd "$PJD"

for i in ${Files[@]}; do
     # echo -e "git add $i"
     git add $i
done

echo -e "\n${k}. Default static files copied\n"
((k = k + 1))


# Process dynamic content
# Update README.md file
##########################################################################################
# Declare arrays of string with type
declare -a all_specs=("none" "docs" "README")

if item_in_array all_specs $spec; then
    declare -a FileParts=("HEADER.md" "TOC.md" "DESCRIPTION.md" "PREREQUISITES.md" "INSTALLATION.md" 
                          "CONTRIBUTING.md" "LICENSE.md" "CITATION.md" "CONTACT.md")

    declare -a Substitutes=("{project}" "{author}" "{year}" "{version}" "{repo}" "{remotemaster}" 
                            "{contributors}" "{rtdname}")

    # Iterate the string array using for loop
    for i in ${FileParts[@]}; do
        cp "$DCPD/$i" "$TPD"
        for j in ${Substitutes[@]}; do
            v="$(substitute "$j")"
            # echo -e "substituting $v for $j"
            replace_in_file "$TPD/$i" $j "${!v}"
        done
        cat "$TPD/$i" >> "$PJD/README.md"
    done

    git add README.md
    echo -e "\n${k}. README.md created\n"
    ((k = k + 1))
fi


# Update dynamic files
##########################################################################################
# Declare arrays of string with type
declare -a no_specs=("none")
declare -a docs_specs=("none" "docs")

if item_in_array docs_specs $spec; then 
    declare -a FileParts=("docs/source/conf.py" "docs/source/index.rst" "docs/source/modules.rst" "docs/source/first_steps.rst" "definitions.py")
fi
if item_in_array no_specs $spec; then
   FileParts+=("definitions.py")
fi

mkdir -p "$TPD/docs/source"
mkdir -p "$PJD/docs/source"

for i in ${FileParts[@]}; do
    cp  "$DCPD/$i" "$TPD/$i"
    for j in ${Substitutes[@]}; do
       v="$(substitute "$j")"
       # echo -e "substituting $v for $j"
       replace_in_file "$TPD/$i" $j "${!v}"
    done
     cp "$TPD/$i" "$PJD/$i"
    git add "$PJD/$i"
done

pandoc "$TPD/DESCRIPTION.md" --from markdown --to rst -s -o "$PJD/docs/source/description.rst"
pandoc "$TPD/INSTALLATION.md" --from markdown --to rst -s -o "$TPD/installation.rst"
replace_in_file "$TPD/installation.rst" "| $ " "   $ "  # workaround because pandoc conversion of code-block fails
cp "$TPD/installation.rst" "$PJD/docs/source"

git add "$PJD/docs/source/installation.rst"

echo -e "\n${k}. Default dynamic files adapted and created.\n"
((k = k + 1))

return $k
