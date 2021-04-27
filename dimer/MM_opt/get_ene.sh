#!/bin/sh
#

for i in SiH4_water SiH4_SiH4.con1 SiH4_SiH4.con2  SiH3CH3_SiH3CH3.con1 SiH3CH3_SiH3CH3.con2 SiH3CH3_SiH3CH3.con3 SiH3CH3_water.con1 SiH3CH3_water.con2 SiH3NH2_SiH3NH2.con1 SiH3NH2_SiH3NH2.con2 SiH3NH2_SiH3NH2.con3 SiH3NH2_water.con1 SiH3NH2_water.con2 SiH3OH_SiH3OH.con1 SiH3OH_SiH3OH.con2 SiH3OH_SiH3OH.con3 SiH3OH_water.con1 SiH3OH_water.con2

do
    echo -n "$i   "

    awk 'BEGIN{istart=0;vdw=0;eel=0;vdw14=0;eel14=0} 
         {
           if ($0 ~/FINAL RESULTS/) {istart = 1} 
           if (istart == 1 && $1 == "VDWAALS") {vdw = $3}
           if (istart == 1 && $4 == "EEL") {eel = $6}
           if (istart == 1 && $1 == "1-4 VDW") {vdw14 = $3}
           if (istart == 1 && $1 == "1-4 EEL") {eel14 = $6}
         } 
         END {eint = vdw + eel - vdw14 - eel14; print eint}' out/"$i".out

done
