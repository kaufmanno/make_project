# CONFIGURE YOUR PROJECT SPECS HERE! 
PROJECT="newproject" # should be lowercase to be imported as a package!
REPOHOST="gfa-gitlab.umons.ac.be:kaufmanno"
PROJECT="${PROJECT,,}" # convert to lowercase anyway
AUTHOR="O. KAUFMANN"
CONTRIBUTORS="Be the first one..."
YEAR="$(date +%Y)"
VERSION="0.1"
REPO="$REPOHOST/$PROJECT"
REPOADDRESS="https://${REPOHOST//://}"
REMOTEMASTER="$REPOADDRESS/$PROJECT/blob/master"
PIPFILE='Default'
ACTIVATEPIPENV=1
CLEANUP=1
ENTERPROJECT=1
RTDNAME=${PROJECT//_/-}
RTDNAME="${RTDNAME,,}" # convert to lowercase
