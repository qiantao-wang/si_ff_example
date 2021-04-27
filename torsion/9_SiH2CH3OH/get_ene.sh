#!/bin/sh
#

for i in `ls 9.*.out`
do
    echo -n "$i    "
    awk 'BEGIN{istart=0;nline=0;vdw=0;eel=0;vdw14=0;eel14=0} 
         {
           if ($0 ~/FINAL RESULTS/) {istart = 1} 
           if (istart == 1 && $1 == "NSTEP") {nline = NR}
           if (nline > 1 && NR == nline + 1) {ene = $2}

           #if (istart == 1 && $1 == "VDWAALS") {vdw = $3}
           #if (istart == 1 && $4 == "EEL") {eel = $6}
           #if (istart == 1 && $1 == "1-4 VDW") {vdw14 = $3}
           #if (istart == 1 && $1 == "1-4 EEL") {eel14 = $6}
         } 
         END {printf "%12.5f\n", ene}' $i

done
