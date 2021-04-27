#!/bin/sh
#

t1=`ls output/SiH3NH2_water.con1.*.out`
t2=`ls output/SiH3NH2_water.con2.*.out`

qm=(  \
-0.767 \
-4.192 \
-4.802 \
-5.007 \
-4.958 \
-4.755 \
-4.135 \
-2.295 \
-0.861 \
 2.384 \
-0.654 \
-1.222 \
-1.457 \
-1.493 \
-1.420 \
-1.144 \
-0.441 \
-0.092 \
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


