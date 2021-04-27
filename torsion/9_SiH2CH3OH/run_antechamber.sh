#!/bin/sh
#
## Run antechamber

export AMBERHOME=/home/qwang/amber/amber12_x11_build

for mol in 9
do

    ## Get the prep and parm files
    $AMBERHOME/bin/antechamber -i "$mol".pdb -fi pdb -o "$mol".prepc -fo prepc -c bcc -rn LIG -pf y -s 2 
    $AMBERHOME/bin/parmchk -i "$mol".prepc -f prepc -o "$mol".frcmod
    
done

