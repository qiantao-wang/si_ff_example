#!/bin/sh
#

t1=`ls output/SiH3NH2_SiH3NH2.con1.*.out`
t2=`ls output/SiH3NH2_SiH3NH2.con2.*.out`
t3=`ls output/SiH3NH2_SiH3NH2.con3.*.out`

qm=(  \
 2.295 \
-1.566 \
-2.203 \
-2.406 \
-2.360 \
-2.183 \
-1.698 \
-0.576 \
-0.019 \
 0.950 \
-2.816 \
-3.443 \
-3.648 \
-3.607 \
-3.428 \
-2.896 \
-1.464 \
-0.473 \
 2.782 \
-0.292 \
-0.965 \
-1.123 \
-1.069 \
-0.938 \
-0.653 \
-0.190 \
-0.028 \
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
