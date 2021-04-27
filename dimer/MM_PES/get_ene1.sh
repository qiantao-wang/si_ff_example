#!/bin/sh
#

t1=`ls output/SiH4_SiH4.con1.*.out`
t2=`ls output/SiH4_SiH4.con2.*.out`

qm=(  \
 1.018 \
-0.328 \
-0.498 \
-0.532 \
-0.502 \
-0.446 \
-0.323 \
-0.109 \
-0.023 \
 1.000 \
-0.419 \
-0.578 \
-0.598 \
-0.555 \
-0.489 \
-0.352 \
-0.118 \
-0.025 \
)

n=0
for i in $t1  $t2 
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
