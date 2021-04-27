#!/bin/sh
#

t1=`ls output/SiH3OH_SiH3OH.con1.*.out`
t2=`ls output/SiH3OH_SiH3OH.con2.*.out`
t3=`ls output/SiH3OH_SiH3OH.con3.*.out`

qm=(  \
 1.558 \
-1.837 \
-2.385 \
-2.542 \
-2.474 \
-2.287 \
-1.798 \
-0.642 \
-0.154 \
 4.563 \
-0.382 \
-1.192 \
-1.377 \
-1.308 \
-1.150 \
-0.805 \
-0.243 \
-0.044 \
-0.761 \
-4.770 \
-5.506 \
-5.776 \
-5.751 \
-5.546 \
-4.877 \
-2.812 \
-1.119 \
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
