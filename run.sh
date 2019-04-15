#!/bin/bash
IMPORTTABLENAME="SamLdap" # name of refernce table qradar is importing LDAP into (should already exist in Qradar)
REFSETNAME="LdapRefSet1" # name of refernce set to copy values into (will be created if it isn't there)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/"
DATAFILENAME=data.txt

echo "running - getting ref table data"
# Erase the data file
echo "removing old data file"
rm data.txt
# export all data from the refernce table into a file
echo "exporting from Qradar into "$DIR$DATAFILENAME
/opt/qradar/bin/ReferenceDataUtil.sh list $IMPORTTABLENAME displayContents | grep Key | sed 's/.*Data=//' >$DIR$DATAFILENAME

# Create ref set
echo "trying to create new refset incase it doesn't exist"
/opt/qradar/bin/ReferenceSetUtil.sh create $REFSETNAME ALN
# Remove all the old elements
echo "removing old elements from list"
/opt/qradar/bin/ReferenceSetUtil.sh purge $REFSETNAME ## remove all the old elements
#load new elements
echo loading from $DIR$DATAFILENAME
/opt/qradar/bin/ReferenceSetUtil.sh load $REFSETNAME $DIR$DATAFILENAME ##load new elements
