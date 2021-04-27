#!/bin/sh
#

t1=`ls output/SiH4_water.*.out`

qm=(  \
 2.606 \
-0.629 \
-1.192 \
-1.402 \
-1.414 \
-1.322 \
-1.025 \
-0.354 \
-0.075 \
)

n=0
for i in $t1 
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


