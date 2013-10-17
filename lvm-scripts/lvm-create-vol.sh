#!/bin/sh
#Logical Volume Create Script v1.0


# Istrctions
# ---------
# This script take 2 argunments
# *Numbers of volumes to create & *size of the volumes in GB
#
# Use "lvdisplay" to view volumes created


#VARS

VOL_GROUP="vg0"  #Defines the volume group to create volumes on
if [ $1 ];
then
    VOLUMES=$1;
else
    echo "Number of volumes needed";
    exit;
fi

if [ $2 ];
then
    SIZE=$2;
else
    echo "Size of volumes to be created needed in (GB)";
    exit;
fi

# --------------------------------------------------
# If all params excepted create the number $VOLUMES
# logical volumes of $SIZE GB on vg $VOL_GROUP

VOL=0
while [ $VOL -lt $VOLUMES ];
do
    #create volumes
    lvcreate -L $SIZE -n vol$VOL $VOL_GROUP;
    VOL=$(( $VOL  1 ));
done 