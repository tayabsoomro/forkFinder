
if [ $# -lt 2 ]
then
	echo "USAGE: ./forkFinder <TaxID1> <TaxID2>"
	exit 1
fi

TAXID1=$1
TAXID2=$2

LIN1=$(cat fullnamelineage.dmp | grep -E "^$TAXID1\s+" | cut -d '|' -f3 | xargs)
LIN2=$(cat fullnamelineage.dmp | grep -E "^$TAXID2\s+" | cut -d '|' -f3 | xargs)

if [ "$LIN1" == "" ]  ||  [ "$LIN2" == "" ]
then
	echo "ERROR: Invalid TaxIDs"
	exit 1
fi


LIN1_LEN=$(awk -F';' '{print NF; exit}' <<< "$LIN1")
LIN2_LEN=$(awk -F';' '{print NF; exit}' <<< "$LIN2")


MAX_LEN=$(( $LIN1_LEN > $LIN2_LEN ? $LIN1_LEN-1 : $LIN2_LEN-1 ))

for (( c=1; c<=$MAX_LEN; c++ ))
do
	CURR1=$(cut -d ';' -f$c <<< "$LIN1")
	CURR2=$(cut -d ';' -f$c <<< "$LIN2")
	
	if [ "$CURR1" != "$CURR2" ]
	then
		echo "Depth: $c"
		echo "Rank for #1: $CURR1"
		echo "Rank for #2: $CURR2"
		exit 0
	fi
done
