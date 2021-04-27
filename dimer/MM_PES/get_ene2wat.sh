#!/bin/sh
#

t1=`ls output/SiH3CH3_water.con1.*.out`
t2=`ls output/SiH3CH3_water.con2.*.out`

qm=(  \
 1.580 \
-0.458 \
-0.814 \
-0.957 \
-0.978 \
-0.931 \
-0.755 \
-0.303 \
-0.050 \
 4.648 \
-0.056 \
-0.782 \
-1.043 \
-1.065 \
-0.976 \
-0.706 \
-0.171 \
 0.012 \
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


