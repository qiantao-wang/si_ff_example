#!/bin/sh
#
## Run antechamber

export AMBERHOME=/home/qwang/amber/amber12_x11_build

for mol in 3
do

    ## Get the prep files
    $AMBERHOME/bin/antechamber -i "$mol".pdb -fi pdb -o "$mol".prepc -fo prepc -c bcc -rn LIG -pf y
    
done

