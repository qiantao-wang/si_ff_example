#!/bin/sh
#

t1=`ls output/SiH3OH_water.con1.*.out`
t2=`ls output/SiH3OH_water.con2.*.out`

qm=(  \
-0.742 \
-4.941 \
-5.744 \
-6.063 \
-6.073 \
-5.891 \
-5.242 \
-3.130 \
-1.324 \
 3.761 \
-1.114 \
-1.962 \
-2.282 \
-2.293 \
-2.123 \
-1.618 \
-0.564 \
-0.115 \
)

n=0
for i in $t1 $t2
do
    #echo ${qm[$n]}
    echo -n "$i   ${qm[$n]}   "
    awk 'BEGIN{istart=0;vdw=0;eel=0;vdw14=0;eel14=0} 
         {
           if ($0 ~/FINAL RESULTS/) {istart = 1} 
           if (istart == 1 && $1 == "VDWAALS") {vdw = $3}
           if (istart == 1 && $4 == "EEL") {eel = $6}
           if (istart == 1 && $1 == "1-4 VDW") {vdw14 = $3}
           if (istart == 1 && $1 == "1-4 EEL") {eel14 = $6}
         } 
         END {eint = vdw + eel - vdw14 - eel14; print eint}' $i

 n=`expr $n + 1`
done


