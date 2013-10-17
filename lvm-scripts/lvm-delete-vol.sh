#!/bin/sh
#Logical Volume Create Script v1.0


# Istrctions
# ---------
# This script take 2 argunments
# *Number of volume from vol#  & *(optional) to vol# 
#
# Use "lvdisplay" to view volumes created


#VARS

VOL_GROUP="vg0"  #Defines the volume group to create volumes on
if [ $1 ];
then
    FROM_VOL=$1;
else
    echo "From Volume# needed";
    exit;
fi

if [ $2 ];
then
    TO_VOL=$2;
else
    echo "To Volume# not specified, deleteing single volume";
    TO_VOL=$1
fi

# --------------------------------------------------
# If all params excepted delee the number vols 
# from $FROM_VOL to $TO_VOL

while [ $FROM_VOL -le $TO_VOL ];
do
    #create volumes
    lvremove -f /dev/$VOL_GROUP/vol$FROM_VOL;
    FROM_VOL=$(( $FROM_VOL  1 ));
done