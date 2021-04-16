. config.sh

CWD=$(pwd)  # setup_project directory
SCPD="$CWD/static_components"
echo "Standard project static components directory: $SCPD"
DCPD="$CWD/dynamic_components"
echo "Standard project dynamic components directory: $DCPD"
PJD="$(dirname "$CWD")/${PROJECT}"  # Project directory
echo "Creating project ${PROJECt} in $PJD"
mkdir -p "$PJD"
cd "$PJD"
TPD="$PJD/tmp"
mkdir -p "$TPD"

