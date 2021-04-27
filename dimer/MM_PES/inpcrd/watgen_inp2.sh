#!/bin/sh
#

#for i in `ls xyz/SiH3CH3_water.con1.*.xyz`
for i in `ls xyz/SiH3CH3_water.con2.*.xyz`
do
    #echo $i
    j=`echo $i | awk -F '/' '{print $2}' | head -c -5`
    echo $j
    f=$j".inpcrd"


    echo "default_name" > $f
    echo "    11" >> $f

    awk '{if (NF == 4 && NR > 2) {if (NR%2 == 0) {printf "%12.7f%12.7f%12.7f\n", $2, $3, $4} else {printf "%12.7f%12.7f%12.7f", $2, $3, $4} }}' $i >> $f

done
