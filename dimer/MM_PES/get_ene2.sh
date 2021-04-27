#!/bin/sh
#

t1=`ls output/SiH3CH3_SiH3CH3.con1.*.out`
t2=`ls output/SiH3CH3_SiH3CH3.con2.*.out`
t3=`ls output/SiH3CH3_SiH3CH3.con3.*.out`

qm=(  \
1.692 \
-0.543 \
-0.824 \
-0.885 \
-0.834 \
-0.745 \
-0.549 \
-0.196 \
-0.050 \
 1.799 \
-0.434 \
-0.840 \
-0.947 \
-0.889 \
-0.773 \
-0.534 \
-0.154 \
-0.022 \
 0.581 \
-0.332 \
-0.456 \
-0.485 \
-0.464 \
-0.421 \
-0.321 \
-0.118 \
-0.023 \
)

n=0
for i in $t1 $t2 $t3
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
